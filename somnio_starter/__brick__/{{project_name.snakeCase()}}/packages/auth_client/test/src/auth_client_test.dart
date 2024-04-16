import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('AuthClient', () {
    late AuthenticationClient repository;

    const validEmail = 'email@example.com';
    const validPassword = 'password';

    setUp(() {
      repository = AuthenticationClient();
    });

    test('can be instantiated', () {
      final repository = AuthenticationClient();
      expect(repository, isNotNull);
      expect(repository, isA<AuthenticationClient>());
    });

    test('signs in user correctly', () {
      expect(
        () async => repository.signInUser(
          email: validEmail,
          password: validPassword,
        ),
        returnsNormally,
      );
    });

    test('signs out user correctly', () {
      expect(
        () async => repository.signOut(),
        throwsUnimplementedError,
      );
    });

    test('fetch user token correctly', () {
      expect(
        () async => repository.fetchToken(),
        returnsNormally,
      );
    });

    test('refreshes user token correctly', () {
      expect(
        () async => repository.requestTokenRefresh(),
        throwsUnimplementedError,
      );
    });

    test('reauthenticates user', () {
      expect(
        () async => repository.reAuthenticate(
          email: validEmail,
          password: validPassword,
        ),
        throwsUnimplementedError,
      );
    });

    test('deletes account', () {
      expect(
        () async => repository.deleteAccount(),
        returnsNormally,
      );
    });
  });
}
