import 'package:form_inputs/form_inputs.dart';
import 'package:test/test.dart';

void main() {
  const otpString = '123456';
  group('Otp', () {
    group('constructors', () {
      test('pure creates correct instance', () {
        const otp = Otp.pure();
        expect(otp.value, '');
        expect(otp.isPure, true);
      });

      test('dirty creates correct instance', () {
        const otp = Otp.dirty(otpString);
        expect(otp.value, otpString);
        expect(otp.isPure, false);
      });
    });

    group('validator', () {
      test('returns empty error when otp is empty', () {
        expect(
          const Otp.dirty().error,
          OtpValidationError.invalid,
        );
      });

      test('returns invalid error when otp is malformed', () {
        expect(
          const Otp.dirty('test').error,
          OtpValidationError.invalid,
        );
      });

      test('is valid when otp is valid', () {
        expect(
          const Otp.dirty(otpString).error,
          isNull,
        );
      });
    });
  });
}
