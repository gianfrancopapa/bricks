import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';

void main() {
  const testEmail1 = 'test1@example.com';
  const testEmail2 = 'test2@example.com';
  const testPassword1 = 'password1';
  const testPassword2 = 'password2';
  const testName1 = 'John Doe';
  const testName2 = 'Jane Doe';

  group('SignUpEvent', () {
    group('SignUpEmailChanged', () {
      test('supports value comparison', () {
        expect(
          const SignUpEmailChanged(testEmail1),
          const SignUpEmailChanged(testEmail1),
        );
      });

      test('two different instances with different emails are not equal', () {
        expect(
          const SignUpEmailChanged(testEmail1),
          isNot(const SignUpEmailChanged(testEmail2)),
        );
      });
    });

    group('SignUpPasswordChanged', () {
      test('supports value comparison', () {
        expect(
          const SignUpPasswordChanged(password: testPassword1),
          const SignUpPasswordChanged(password: testPassword1),
        );
      });

      test('two different instances with different passwords are not equal',
          () {
        expect(
          const SignUpPasswordChanged(password: testPassword1),
          isNot(const SignUpPasswordChanged(password: testPassword2)),
        );
      });
    });

    group('SignUpConfirmationPasswordChanged', () {
      test('supports value comparison', () {
        expect(
          const SignUpConfirmationPasswordChanged(password: testPassword1),
          const SignUpConfirmationPasswordChanged(password: testPassword1),
        );
      });

      test('two different instances with different passwords are not equal',
          () {
        expect(
          const SignUpConfirmationPasswordChanged(password: testPassword1),
          isNot(
            const SignUpConfirmationPasswordChanged(password: testPassword2),
          ),
        );
      });
    });

    group('SignUpWithEmailAndPasswordRequested', () {
      test('supports value comparison', () {
        expect(
          const SignUpWithEmailAndPasswordRequested(),
          const SignUpWithEmailAndPasswordRequested(),
        );
      });
    });

    group('SignUpPasswordVisibilityChanged', () {
      test('supports value comparison', () {
        expect(
          const SignUpPasswordVisibilityChanged(obscure: true),
          const SignUpPasswordVisibilityChanged(obscure: true),
        );
      });

      test(
          'two different instances with different obscure values are not equal',
          () {
        expect(
          const SignUpPasswordVisibilityChanged(obscure: true),
          isNot(const SignUpPasswordVisibilityChanged(obscure: false)),
        );
      });
    });

    group('SignUpNameChanged', () {
      test('supports value comparison', () {
        expect(
          const SignUpNameChanged(testName1),
          const SignUpNameChanged(testName1),
        );
      });

      test('two different instances with different names are not equal', () {
        expect(
          const SignUpNameChanged(testName1),
          isNot(const SignUpNameChanged(testName2)),
        );
      });
    });
  });
}
