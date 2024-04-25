import 'package:flutter_test/flutter_test.dart';
import 'package:instagram/authentication/delete_account/delete_account.dart';

void main() {
  group('DeleteAccountEvent', () {
    group('DeleteAccountEmailChanged', () {
      test('supports value comparison', () {
        expect(
          const DeleteAccountEmailChanged('email'),
          const DeleteAccountEmailChanged('email'),
        );
      });

      test('two different instances with different emails are not equal', () {
        expect(
          const DeleteAccountEmailChanged('email1'),
          isNot(const DeleteAccountEmailChanged('email2')),
        );
      });
    });

    group('DeleteAccountPasswordChanged', () {
      test('supports value comparison', () {
        expect(
          const DeleteAccountPasswordChanged('password'),
          const DeleteAccountPasswordChanged('password'),
        );
      });

      test('two different instances with different passwords are not equal',
          () {
        expect(
          const DeleteAccountPasswordChanged('password1'),
          isNot(const DeleteAccountPasswordChanged('password2')),
        );
      });
    });

    group('DeleteAccountRequested', () {
      test('supports value comparison', () {
        expect(const DeleteAccountRequested().props, <Object>[]);
        expect(const DeleteAccountRequested(), const DeleteAccountRequested());
      });
    });

    group('DeleteAccountSubmitted', () {
      test('supports value comparison', () {
        expect(const DeleteAccountSubmitted().props, <Object>[]);
        expect(const DeleteAccountSubmitted(), const DeleteAccountSubmitted());
      });
    });

    group('DeleteAccountResetted', () {
      test('supports value comparison', () {
        expect(const DeleteAccountResetted().props, <Object>[]);
        expect(const DeleteAccountResetted(), const DeleteAccountResetted());
      });
    });
  });
}
