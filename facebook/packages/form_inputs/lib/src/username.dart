import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

/// Username Form Input Validation Error
enum UsernameValidationError {
  /// Username is invalid (generic validation error)
  invalid,

  /// Username is empty
  empty,
}

/// {@template username}
/// Reusable username form input.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class Username extends FormzInput<String, UsernameValidationError> {
  /// {@macro Username}
  /// Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  /// {@macro Username}
  /// Call super.dirty to represent a modified form input.
  const Username.dirty([super.value = '']) : super.dirty();

  static final _usernameRegExp = RegExp(
    r'^^[a-zA-Z0-9_-]+$',
    caseSensitive: false,
    unicode: true,
    dotAll: true,
  );

  /// Override validator to handle validating a given input value.
  @override
  UsernameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return UsernameValidationError.empty;

    return _usernameRegExp.hasMatch(value)
        ? null
        : UsernameValidationError.invalid;
  }
}
