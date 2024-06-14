import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('Authentication Client Exceptions', () {
    test('SignInFailure should throw AuthenticationClientException', () {
      expect(
        () => throw SignInFailure('Sign-in failed', StackTrace.current),
        throwsA(isA<AuthenticationClientException>()),
      );
    });

    test('InvalidUserFailure should throw AuthenticationClientException', () {
      expect(
        () => throw InvalidUserFailure('User not found', StackTrace.current),
        throwsA(isA<AuthenticationClientException>()),
      );
    });

    // Example of a test that expects a specific error type:
    test('SignInFailure should be caught as AuthenticationClientException', () {
      try {
        throw SignInFailure('Sign-in failed', StackTrace.current);
      } catch (e) {
        expect(e, isA<AuthenticationClientException>());
      }
    });

    test(
        'ReAuthenticateFailure should be caught as AuthenticationClientException',
        () {
      try {
        throw ReAuthenticateFailure(
          'Re-authentication failed',
          StackTrace.current,
        );
      } catch (e) {
        expect(e, isA<AuthenticationClientException>());
      }
    });

    test(
        'DeleteAccountFailure should be caught as AuthenticationClientException',
        () {
      try {
        throw DeleteAccountFailure(
          'Delete account failed',
          StackTrace.current,
        );
      } catch (e) {
        expect(e, isA<AuthenticationClientException>());
      }
    });
  });
}