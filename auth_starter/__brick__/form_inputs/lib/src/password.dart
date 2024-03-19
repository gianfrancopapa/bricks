import 'package:formz/formz.dart';

/// Password Form Input Validation Error
enum PasswordValidationError {
  /// Password is empty
  empty,

  /// Password is shorter than 8 characters
  notLongEnough,
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

  /// Override validator to handle validating a given input value.
  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (value.length < 8) {
      return PasswordValidationError.notLongEnough;
    }
    return null;
  }
}
