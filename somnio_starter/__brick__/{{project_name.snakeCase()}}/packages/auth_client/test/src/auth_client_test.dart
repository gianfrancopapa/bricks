import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('AuthClient', () {

    test('can be instantiated', () {
      final repository = AuthenticationClient();
      expect(repository, isNotNull);
      expect(repository, isA<AuthenticationClient>());
    });

    test('signs in user correctly', () {
      final repository = AuthenticationClient();
      expect(
        () async => repository.signInUser(email: 'email', password: 'password'),
        returnsNormally,
      );
    });

    test('signs out user correctly', () {
      final repository = AuthenticationClient();
      expect(
        () async => repository.signOut(),
        throwsUnimplementedError,
      );
    });

    test('fetch user token correctly', () {
      final repository = AuthenticationClient();
      expect(
        () async => repository.fetchToken(),
        returnsNormally,
      );
    });

    test('refreshes user token correctly', () {
      final repository = AuthenticationClient();
      expect(
        () async => repository.requestTokenRefresh(),
        throwsUnimplementedError,
      );
    });
  });
}
