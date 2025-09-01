import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const nameString = 'test';
  group('Name', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const name = Name.pure();
        expect(name.value, '');
        expect(name.isPure, true);
      });

      test('dirty creates correct instance', () {
        const name = Name.dirty(nameString);
        expect(name.value, nameString);
        expect(name.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when name is empty', () {
        expect(
          const Name.dirty().error,
          NameValidationError.empty,
        );
      });

      test('returns invalid error when name is malformed', () {
        expect(
          const Name.dirty('test').error,
          isNull,
        );
      });

      test('is valid when name is valid', () {
        expect(
          const Name.dirty(nameString).error,
          isNull,
        );
      });
    });
  });
}
