import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const addressString = '1142 Main Street, Seattle, WA 98101';
  group('Address Label', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const address = AddressLabel.pure();
        expect(address.value, '');
        expect(address.isPure, true);
      });

      test('dirty creates correct instance', () {
        const address = AddressLabel.dirty(addressString);
        expect(address.value, addressString);
        expect(address.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when address is empty', () {
        expect(
          const AddressLabel.dirty().error,
          AddressLabelValidationError.empty,
        );
      });

      test('returns invalid error when address is malformed', () {
        expect(
          const AddressLabel.dirty('test').error,
          isNull,
        );
      });

      test('is valid when address is valid', () {
        expect(
          const AddressLabel.dirty(addressString).error,
          isNull,
        );
      });
    });
  });
}
