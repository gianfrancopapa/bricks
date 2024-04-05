import 'package:api_client/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('SignUpFailure', () {
    test('constructs properly', () {
      final failure = SignUpFailure(Exception(), StackTrace.empty);
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });

  group('EmailAlreadyExistFailure', () {
    test('constructs properly', () {
      final failure = EmailAlreadyExistFailure(Exception(), StackTrace.empty);
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });

  group('EmailVerificationFailure', () {
    test('constructs properly', () {
      final failure = EmailVerificationFailure(Exception(), StackTrace.empty);
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });

  group('ForgotPasswordFailure', () {
    test('constructs properly', () {
      final failure = ForgotPasswordFailure(Exception(), StackTrace.empty);
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });

  group('UpdatePasswordFailure', () {
    test('constructs properly', () {
      final failure = UpdatePasswordFailure(Exception(), StackTrace.empty);
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });

  group('SendOtpCodeFailure', () {
    test('constructs properly', () {
      final failure = SendOtpCodeFailure(Exception(), StackTrace.empty);
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });

  group('GetAuthenticatedUserFailure', () {
    test('constructs properly', () {
      final failure = GetAuthenticatedUserFailure(
        Exception(),
        StackTrace.empty,
      );
      expect(failure.error, isNotNull);
      expect(failure.stackTrace, isNotNull);
    });
  });
}
