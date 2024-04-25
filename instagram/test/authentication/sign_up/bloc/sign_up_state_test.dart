import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:instagram/authentication/sign_up/sign_up.dart';

void main() {
  group('SignUpState', () {
    const name = Name.dirty('John Doe');
    const invalidPassword = Password.dirty('password123');
    const validPassword = Password.dirty('Password123!');
    const validPasswordValue = 'Password123!';
    const email = Email.dirty('test@example.com');

    test('supports value comparison', () {
      const state1 = SignUpState.initial();
      const state2 = SignUpState.initial();

      expect(state1, state2);
    });

    test('copyWith method creates new instance with replaced values', () {
      const originalState = SignUpState.initial();
      final modifiedState = originalState.copyWith(
        status: FormzSubmissionStatus.success,
        email: email,
        password: validPassword,
        name: name,
        confirmationPassword: validPassword.value,
        obscurePasswords: false,
      );

      expect(modifiedState.status, FormzSubmissionStatus.success);
      expect(modifiedState.email.value, email.value);
      expect(modifiedState.password.value, validPassword.value);
      expect(modifiedState.name.value, name.value);
      expect(modifiedState.confirmationPassword, validPassword.value);
      expect(modifiedState.obscurePasswords, false);
    });

    test('valid getter returns true when all fields are valid', () {
      const state = SignUpState(
        status: FormzSubmissionStatus.success,
        email: email,
        password: validPassword,
        name: name,
        confirmationPassword: validPasswordValue,
        obscurePasswords: false,
      );

      expect(state.valid, true);
    });

    test('valid getter returns false when any field is invalid', () {
      const state = SignUpState(
        status: FormzSubmissionStatus.initial,
        email: email,
        password: invalidPassword,
        name: Name.pure(),
        confirmationPassword: validPasswordValue,
        obscurePasswords: false,
      );

      expect(state.valid, false);
    });

    test('props list contains all state properties', () {
      const state = SignUpState(
        status: FormzSubmissionStatus.initial,
        email: email,
        password: validPassword,
        name: name,
        confirmationPassword: validPasswordValue,
        obscurePasswords: false,
      );

      expect(state.props, [
        FormzSubmissionStatus.initial,
        email,
        validPassword,
        validPasswordValue,
        false,
        name,
      ]);
    });
  });
}
