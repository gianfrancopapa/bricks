// ignore_for_file: prefer_const_constructors
import 'package:api_client/api_client.dart';
import 'package:auth_client/auth_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

class MockApiClient extends Mock implements ApiClient {}

class MockAuthenticationClient extends Mock implements AuthenticationClient {}

void main() {
  group('UserRepository', () {
    late ApiClient apiClient;
    late AuthenticationClient authenticationClient;

    setUp(() {
      apiClient = MockApiClient();
      authenticationClient = MockAuthenticationClient();
    });

    test('can be instantiated', () {
      expect(
        UserRepository(
          apiClient: apiClient,
          authenticationClient: authenticationClient,
        ),
        isNotNull,
      );
    });
  });
}
