import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpApiClient extends Mock implements HttpApiClient {}

void main() {
  late HttpApiClient mockHttpApiClient;
  late AppConfigResource appConfigResource;

  setUp(() {
    mockHttpApiClient = MockHttpApiClient();
    appConfigResource = AppConfigResource(client: mockHttpApiClient);
  });

  group('AppConfigResource', () {
    test('getDownForMaintenance returns true when API call succeeds', () async {
      final response = Response(jsonEncode(true), 200);
      when(() => mockHttpApiClient.get(AppConfigResource.kDownForMaintenance))
          .thenAnswer((_) async => response);

      final result = await appConfigResource.getDownForMaintenance();

      expect(result, isTrue);
    });

    test('getDownForMaintenance throws CheckDownForMaintenanceFailure on error',
        () async {
      final response = Response('Internal Server Error', 500);
      when(() => mockHttpApiClient.get(AppConfigResource.kDownForMaintenance))
          .thenAnswer((_) async => response);

      expect(
        () async => appConfigResource.getDownForMaintenance(),
        throwsA(isA<CheckDownForMaintenanceFailure>()),
      );
    });

    test('getUpgrade returns Upgrade when API call succeeds', () async {
      final upgradeJson = {
        'androidBuildNumber': 22,
        'androidUpgradeUrl': 'https://example.com/upgrade',
        'iosBuildNumber': 22,
        'iosUpgradeUrl': 'https://example.com/upgrade',
      };
      final response = Response(jsonEncode(upgradeJson), 200);
      when(() => mockHttpApiClient.get(AppConfigResource.kUpgrade))
          .thenAnswer((_) async => response);

      final result = await appConfigResource.getUpgrade();

      expect(result, isA<Upgrade>());
      expect(result.androidBuildNumber, 22);
      expect(result.androidUpgradeUrl, 'https://example.com/upgrade');
      expect(result.iosBuildNumber, 22);
      expect(result.iosUpgradeUrl, 'https://example.com/upgrade');
    });

    test('getUpgrade throws CheckForceUpgradeFailure on error', () async {
      final response = Response('Internal Server Error', 500);
      when(() => mockHttpApiClient.get(AppConfigResource.kUpgrade))
          .thenAnswer((_) async => response);

      expect(
        () async => appConfigResource.getUpgrade(),
        throwsA(isA<CheckForceUpgradeFailure>()),
      );
    });
  });
}
