import 'package:formz/formz.dart';

/// Password Form Input Validation Error
enum PasswordValidationError {
  /// Password is empty
  empty,

  /// Password is shorter than 8 characters
  notLongEnough,

  /// Password does not contain a digit
  noDigit,

  /// Password does not contain an upper case
  noUpperCase,

  /// Password does not contain a lower case
  noLowerCase,

  /// Password does not contain a special character
  noSpecialCharacter,
}

/// {@template password}
/// Reusable password form input.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  ///  Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  /// {@macro password}
  /// Call super.dirty to represent a modified form input.
  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _upperCaseRegex = RegExp('[A-Z]');

  static final RegExp _lowerCaseRegex = RegExp('[a-z]');

  static final RegExp _specialCharactersRegex =
      RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static final RegExp _digitsRegex = RegExp('[0-9]');

  /// Override validator to handle validating a given input value.
  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 8) {
      return PasswordValidationError.notLongEnough;
    }
    if (!value.contains(_digitsRegex)) {
      return PasswordValidationError.noDigit;
    }
    if (!value.contains(_upperCaseRegex)) {
      return PasswordValidationError.noUpperCase;
    }
    if (!value.contains(_lowerCaseRegex)) {
      return PasswordValidationError.noLowerCase;
    }
    if (!value.contains(_specialCharactersRegex)) {
      return PasswordValidationError.noSpecialCharacter;
    }
    return null;
  }
}
