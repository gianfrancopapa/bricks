import 'package:form_inputs/form_inputs.dart';

/// Address Label Form Input Validation Error
enum AddressLabelValidationError {
  /// Address Label is invalid (generic validation error)
  invalid,

  /// Address Label is empty
  empty,
}

/// {@template address_label}
/// Reusable address label form input.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class AddressLabel extends FormzInput<String, AddressLabelValidationError> {
  /// {@macro address_label}
  /// Call super.pure to represent an unmodified form input.
  const AddressLabel.pure() : super.pure('');

  /// {@macro address_label}
  /// Call super.dirty to represent a modified form input.
  const AddressLabel.dirty([super.value = '']) : super.dirty();

  /// Override validator to handle validating a given input value.
  @override
  AddressLabelValidationError? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AddressLabelValidationError.empty;
    }
    if (value.trim().isNotEmpty) return null;
    return AddressLabelValidationError.invalid;
  }
}
