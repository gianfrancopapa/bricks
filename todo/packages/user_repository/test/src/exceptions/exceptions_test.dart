import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('SignOutFailure', () {
    test('constructor initializes properties', () {
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;

      final failure = SignOutFailure(error, stackTrace);

      expect(failure.error, equals(error));
      expect(failure.stackTrace, equals(stackTrace));
    });

    test('user delete exception', () {
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;

      final failure = UserDeleteAccountFailure(error, stackTrace);

      expect(failure.error, equals(error));
      expect(failure.stackTrace, equals(stackTrace));
    });

    test('user reauthenticate exception', () {
      final error = Exception('Test error');
      final stackTrace = StackTrace.current;

      final failure = UserReAuthenticateFailure(error, stackTrace);

      expect(failure.error, equals(error));
      expect(failure.stackTrace, equals(stackTrace));
    });
  });
}
