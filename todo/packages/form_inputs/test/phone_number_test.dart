import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const phoneString = '+16505551234';
  group('Phone Number', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const phone = PhoneNumber.pure();
        expect(phone.value, '');
        expect(phone.isPure, true);
      });

      test('dirty creates correct instance', () {
        const phone = PhoneNumber.dirty(phoneString);
        expect(phone.value, phoneString);
        expect(phone.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when phone is empty', () {
        expect(
          const PhoneNumber.dirty().error,
          PhoneNumberValidationError.empty,
        );
      });

      test('returns invalid error when phone is malformed', () {
        expect(
          const PhoneNumber.dirty('test').error,
          PhoneNumberValidationError.invalid,
        );
      });

      test('is valid when phone is valid', () {
        expect(
          const PhoneNumber.dirty(phoneString).error,
          PhoneNumberValidationError.invalid,
        );
      });
    });
  });
}
