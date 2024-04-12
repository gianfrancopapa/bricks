import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';

void main() {
  const validEmail = Email.dirty('test@example.com');
  const invalidEmail = Email.dirty('invalid');

  group('ForgotPasswordState', () {
    test('supports value comparison', () {
      const state1 = ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        email: Email.pure(),
      );

      const state2 = ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        email: Email.pure(),
      );

      expect(state1, state2);
    });

    test('copyWith method creates new instance with replaced values', () {
      const originalState = ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        email: Email.pure(),
      );

      final modifiedState = originalState.copyWith(
        status: ForgotPasswordStatus.loading,
        email: validEmail,
      );

      expect(modifiedState.status, ForgotPasswordStatus.loading);
      expect(modifiedState.email.value, validEmail.value);
    });

    test('valid getter returns true when email is valid', () {
      const state = ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        email: validEmail,
      );

      expect(state.valid, true);
    });

    test('valid getter returns false when email is invalid', () {
      const state = ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        email: invalidEmail,
      );

      expect(state.valid, false);
    });

    test('props list contains status and email', () {
      const state = ForgotPasswordState(
        status: ForgotPasswordStatus.initial,
        email: validEmail,
      );

      expect(state.props, [
        ForgotPasswordStatus.initial,
        validEmail,
      ]);
    });
  });
}
