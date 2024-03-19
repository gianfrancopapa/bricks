// ignore_for_file: prefer_const_constructors
import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const passwordString = '12345678';
  group('Password', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        final email = Password.pure();
        expect(email.value, '');
        expect(email.isPure, true);
      });

      test('dirty creates correct instance', () {
        final email = Password.dirty(passwordString);
        expect(email.value, passwordString);
        expect(email.isPure, false);
      });
    });

    group('validator', () {
      test('returns invalid error when password is empty', () {
        expect(
          Password.dirty().error,
          PasswordValidationError.empty,
        );
      });

      test('returns invalid error when password is less than 6 characters', () {
        expect(
          Password.dirty('test').error,
          PasswordValidationError.notLongEnough,
        );
      });

      test('is valid when password is valid', () {
        expect(
          Password.dirty(passwordString).error,
          isNull,
        );
      });
    });
  });
}
