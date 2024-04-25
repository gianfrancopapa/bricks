import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

/// Name Form Input Validation Error
enum NameValidationError {
  /// Name is invalid (generic validation error)
  invalid,

  /// Name is empty
  empty,
}

/// {@template name}
/// Reusable name form input.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  /// Call super.pure to represent an unmodified form input.
  const Name.pure() : super.pure('');

  /// {@macro name}
  /// Call super.dirty to represent a modified form input.
  const Name.dirty([super.value = '']) : super.dirty();

  static final _nameRegExp = RegExp(
    r"^[\p{L} ,.'-]*$",
    caseSensitive: false,
    unicode: true,
    dotAll: true,
  );

  /// Override validator to handle validating a given input value.
  @override
  NameValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return NameValidationError.empty;

    return _nameRegExp.hasMatch(value) ? null : NameValidationError.invalid;
  }
}
