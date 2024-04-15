import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const zipString = '12345';

  group('Zip Code', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const zipcode = ZipCode.pure();
        expect(zipcode.value, '');
        expect(zipcode.isPure, true);
      });

      test('dirty creates correct instance', () {
        const zipcode = ZipCode.dirty(value: zipString);
        expect(zipcode.value, zipString);
        expect(zipcode.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when zipcode is empty', () {
        expect(
          const ZipCode.dirty().error,
          ZipCodeValidationError.empty,
        );
      });

      test('returns invalid error when zipcode is malformed', () {
        expect(
          const ZipCode.dirty(value: 'test').error,
          ZipCodeValidationError.invalid,
        );
      });

      test('is valid when zipcode is valid', () {
        expect(
          const ZipCode.dirty(value: zipString).error,
          isNull,
        );
      });
    });
  });
}
