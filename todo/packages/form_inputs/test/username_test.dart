import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const userNameString = 'username';
  group('Username', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const userName = Username.pure();
        expect(userName.value, '');
        expect(userName.isPure, true);
      });

      test('dirty creates correct instance', () {
        const userName = Username.dirty(userNameString);
        expect(userName.value, userNameString);
        expect(userName.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when userName is empty', () {
        expect(
          const Username.dirty().error,
          UsernameValidationError.empty,
        );
      });

      test('returns invalid error when userName is malformed', () {
        expect(
          const Username.dirty('test').error,
          isNull,
        );
      });

      test('is valid when userName is valid', () {
        expect(
          const Username.dirty(userNameString).error,
          isNull,
        );
      });
    });
  });
}
