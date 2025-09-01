import 'package:form_inputs/form_inputs.dart';

/// PhoneNumber Form Input Validation Error
enum PhoneNumberValidationError {
  /// PhoneNumber is invalid (it can only have digits and + sign)
  invalid,

  /// Phone number is too short
  tooShort,

  /// Phone number is too long
  tooLong,

  /// PhoneNumber is empty
  empty,
}

/// {@template phone_number}
/// Reusable PhoneNumber form input that is valid only for 10 digits.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  /// {@macro phone_number}
  /// Call super.pure to represent an unmodified form input.
  const PhoneNumber.pure() : super.pure('');

  /// {@macro phone_number}
  /// Call super.dirty to represent a modified form input.
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  static final _phoneRegex = RegExp(r'^[0-9]{10}$');

  @override
  PhoneNumberValidationError? validator(String value) {
    if (value.isEmpty) return PhoneNumberValidationError.empty;
    return _phoneRegex.hasMatch(value)
        ? null
        : PhoneNumberValidationError.invalid;
  }
}
