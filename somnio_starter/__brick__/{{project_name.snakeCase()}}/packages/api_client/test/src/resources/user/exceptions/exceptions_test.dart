import 'package:auth_client/auth_client.dart';
import 'package:test/test.dart';

void main() {
  group('SignInFailure', () {
    test('constructs correctly', () {
      final error = ArgumentError('Invalid arguments');
      final stackTrace = StackTrace.current;

      final signInFailure = SignInFailure(error, stackTrace);

      expect(signInFailure.error, equals(error));
      expect(signInFailure.stackTrace, equals(stackTrace));
    });
  });

  group('InvalidUserFailure', () {
    test('constructs correctly', () {
      final error = StateError('User not found');
      final stackTrace = StackTrace.current;

      final invalidUserFailure = InvalidUserFailure(error, stackTrace);

      expect(invalidUserFailure.error, equals(error));
      expect(invalidUserFailure.stackTrace, equals(stackTrace));
    });
  });

  group('ReAuthenticateFailure', () {
    test('constructs correctly', () {
      final error = ArgumentError('Could not reauthenticate');
      final stackTrace = StackTrace.current;

      final reauthenticateFailure = ReAuthenticateFailure(error, stackTrace);

      expect(reauthenticateFailure.error, equals(error));
      expect(reauthenticateFailure.stackTrace, equals(stackTrace));
    });
  });

  group('DeleteAccountFailure', () {
    test('constructs correctly', () {
      final error = ArgumentError('Invalid arguments');
      final stackTrace = StackTrace.current;

      final deleteAccountFailure = DeleteAccountFailure(error, stackTrace);

      expect(deleteAccountFailure.error, equals(error));
      expect(deleteAccountFailure.stackTrace, equals(stackTrace));
    });
  });
}
