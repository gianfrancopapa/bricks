import 'package:api_client/api_client.dart';
import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockAppConfigResource extends Mock implements AppConfigResource {}

void main() {
  late AppConfigRepository repository;
  late AppConfigRepository repositoryForiOS;
  late ApiClient mockApiClient;
  late AppConfigResource configResource;

  setUp(() {
    mockApiClient = MockApiClient();
    configResource = MockAppConfigResource();
    repository = AppConfigRepository(
      buildNumber: 10,
      platform: Platform.android,
      apiClient: mockApiClient,
    );
    repositoryForiOS = AppConfigRepository(
      buildNumber: 10,
      platform: Platform.iOS,
      apiClient: mockApiClient,
    );
  });

  group('AppConfigRepository', () {
    test('isDownForMaintenance returns stream of booleans', () {
      when(() => mockApiClient.appConfigResource).thenReturn(configResource);
      when(() => configResource.getDownForMaintenance()).thenAnswer(
        (_) => Future.value(false),
      );

      final stream = repository.isDownForMaintenance();

      expect(stream, emits(false));
    });

    test('isForceUpgradeRequired handles iOS platform', () {
      const mockUpgrade = Upgrade(
        androidBuildNumber: 20,
        iosBuildNumber: 20,
        androidUpgradeUrl: 'https://example.com/android',
        iosUpgradeUrl: 'https://example.com/ios',
      );

      const mockForceUpgrade = ForceUpgrade(
        isUpgradeRequired: false,
        upgradeUrl: '',
      );

      final mockResponse = Future.value(mockUpgrade);
      when(() => mockApiClient.appConfigResource).thenReturn(configResource);
      when(() => configResource.getUpgrade()).thenAnswer((_) => mockResponse);

      final stream = repository.isForceUpgradeRequired();

      expect(stream, emits(mockForceUpgrade));
    });

    test('isForceUpgradeRequired handles iOS platform', () {
      const mockUpgrade = Upgrade(
        androidBuildNumber: 20,
        iosBuildNumber: 20,
        androidUpgradeUrl: 'https://example.com/android',
        iosUpgradeUrl: 'https://example.com/ios',
      );

      const mockForceUpgrade = ForceUpgrade(
        isUpgradeRequired: false,
        upgradeUrl: '',
      );

      final mockResponse = Future.value(mockUpgrade);
      when(() => mockApiClient.appConfigResource).thenReturn(configResource);
      when(() => configResource.getUpgrade()).thenAnswer((_) => mockResponse);

      final stream = repositoryForiOS.isForceUpgradeRequired();

      expect(stream, emits(mockForceUpgrade));
    });
  });
}
