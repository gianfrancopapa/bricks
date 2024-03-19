import 'package:formz/formz.dart';

/// Zip Code Form Input validation error
enum ZipCodeValidationError {
  /// Zip Code is invalid (generic validation error)
  invalid,

  ///Zip code is empty
  empty,
}

/// {@template zip_code}
/// Reusable zip code form input.
/// Extends FormzInput and provides the input type and error type.
/// {@endtemplate}
class ZipCode extends FormzInput<String, ZipCodeValidationError> {
  /// {@macro zip_code}
  /// Call super.pure to represent an unmodified form input.
  const ZipCode.pure({bool required = true})
      : _required = required,
        super.pure('');

  /// {@macro zip_code}
  /// Call super.dirty to represent a modified form input.
  const ZipCode.dirty({String value = '', bool required = true})
      : _required = required,
        super.dirty(value);

  final bool _required;

  /// Matches 5-digit only codes (e.g. 12345)
  static final RegExp _zipCodeRegExp = RegExp(r'(^\d{5}$)');

  /// Override validator to handle validating a given input value.
  @override
  ZipCodeValidationError? validator(String value) {
    if (!_required && value.isEmpty) {
      return null;
    }
    if (_required && value.isEmpty) {
      return ZipCodeValidationError.empty;
    }

    return _zipCodeRegExp.hasMatch(value)
        ? null
        : ZipCodeValidationError.invalid;
  }
}
