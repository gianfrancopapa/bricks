import 'package:api_client/api_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpApiClient extends Mock implements HttpApiClient {}

void main() {
  group('ApiClient', () {
    late HttpApiClient httpClient;

    setUp(() {
      httpClient = MockHttpApiClient();
    });

    test('can be instantiated', () {
      expect(ApiClient(client: httpClient), isNotNull);
    });
  });
}
