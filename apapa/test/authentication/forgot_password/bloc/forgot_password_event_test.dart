import 'package:apapa/authentication/forgot_password/forgot_password.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testEmail1 = 'test1@example.com';
  const testEmail2 = 'test2@example.com';

  group('ForgotPasswordSubmitted', () {
    test('ForgotPasswordSubmitted supports value comparison', () {
      expect(
        const ForgotPasswordSubmitted(),
        const ForgotPasswordSubmitted(),
      );
      expect(
        const ForgotPasswordSubmitted().props,
        const <Object>[],
      );
    });
  });

  group('ForgotPasswordEmailChanged', () {
    test('supports value comparison', () {
      expect(
        const ForgotPasswordEmailChanged(testEmail1),
        const ForgotPasswordEmailChanged(testEmail1),
      );
    });

    test('two different instances with different emails are not equal', () {
      expect(
        const ForgotPasswordEmailChanged(testEmail1),
        isNot(const ForgotPasswordEmailChanged(testEmail2)),
      );
    });
  });
}
