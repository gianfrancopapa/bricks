import 'package:form_inputs/form_inputs.dart';

/// OTP Form Input Validation Error
enum OtpValidationError {
  /// OTP is invalid (generic validation error)
  invalid,

  /// OTP is empty
  empty,
}

/// {@template otp}
/// Reusable OTP form input that is valid only for 6 digits.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class Otp extends FormzInput<String, OtpValidationError> {
  /// {@macro otp}
  /// Call super.pure to represent an unmodified form input.
  const Otp.pure() : super.pure('');

  /// {@macro otp}
  /// Call super.dirty to represent a modified form input.
  const Otp.dirty([super.value = '']) : super.dirty();

  /// Override validator to handle validating a given input value.
  @override
  OtpValidationError? validator(String? value) {
    if (value == null) return OtpValidationError.empty;
    return value.length >= 6 ? null : OtpValidationError.invalid;
  }
}
