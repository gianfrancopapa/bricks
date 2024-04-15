import 'package:api_client/api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpApiClient extends Mock implements HttpApiClient {}

void main() {
  group('ApiClient', () {
    late HttpApiClient httpClient;
    late ApiClient apiClient;

    setUp(() {
      httpClient = MockHttpApiClient();
      apiClient = ApiClient(client: httpClient);
    });

    test('can be instantiated', () {
      expect(apiClient, isNotNull);
    });

    test('userResource returns a valid UserResource instance', () {
      final userResource = apiClient.userResource;
      expect(userResource, isA<UserResource>());
    });
  });
}
