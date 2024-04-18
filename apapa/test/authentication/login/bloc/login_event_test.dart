import 'package:apapa/authentication/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginEvent', () {
    group('LoginEmailChanged', () {
      test('supports value comparison', () {
        expect(
          const LoginEmailChanged('test@example.com'),
          const LoginEmailChanged('test@example.com'),
        );
      });

      test('two different instances with different emails are not equal', () {
        expect(
          const LoginEmailChanged('test1@example.com'),
          isNot(const LoginEmailChanged('test2@example.com')),
        );
      });
    });

    group('LoginPasswordChanged', () {
      test('supports value comparison', () {
        expect(
          const LoginPasswordChanged('password123'),
          const LoginPasswordChanged('password123'),
        );
      });

      test('two different instances with different passwords are not equal',
          () {
        expect(
          const LoginPasswordChanged('password1'),
          isNot(const LoginPasswordChanged('password2')),
        );
      });
    });

    group('LoginWithEmailAndPasswordRequested', () {
      test('supports value comparison', () {
        expect(
          const LoginWithEmailAndPasswordRequested().props,
          equals([]),
        );
        expect(
          const LoginWithEmailAndPasswordRequested(),
          const LoginWithEmailAndPasswordRequested(),
        );
      });
    });

    group('LoginPasswordVisibilityChanged', () {
      test('supports value comparison', () {
        expect(
          const LoginPasswordVisibilityChanged(obscure: true),
          const LoginPasswordVisibilityChanged(obscure: true),
        );
      });

      test(
          'two different instances with different obscure values are not equal',
          () {
        expect(
          const LoginPasswordVisibilityChanged(obscure: true),
          isNot(const LoginPasswordVisibilityChanged(obscure: false)),
        );
      });
    });
  });
}
