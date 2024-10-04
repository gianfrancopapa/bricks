import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temp/authentication/delete_account/delete_account.dart';
import 'package:temp_ui/temp_ui.dart';

import '../../../helpers/helpers.dart';

void main() {
  late DeleteAccountBloc mockDeleteAccountBloc;

  setUp(() {
    mockDeleteAccountBloc = MockDeleteAccountBloc();
    when(() => mockDeleteAccountBloc.state)
        .thenReturn(const DeleteAccountState.initial());
  });
  group('DeleteAccountView', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const DeleteAccountView(),
        deleteAccountBloc: mockDeleteAccountBloc,
      );

      expect(find.byType(DeleteAccountForm), findsOneWidget);
    });

    testWidgets('delete account button adds [DeleteAccountSubmitted] event',
        (WidgetTester tester) async {
      when(() => mockDeleteAccountBloc.state).thenReturn(
        const DeleteAccountState.initial().copyWith(
          email: const Email.dirty('email@email.com'),
          password: const Password.dirty('Password123!'),
        ),
      );
      await tester.pumpApp(
        const DeleteAccountView(),
        deleteAccountBloc: mockDeleteAccountBloc,
      );

      final submitButton = find.byType(UIOutlinedButton);
      await tester.tap(submitButton);

      verify(() => mockDeleteAccountBloc.add(const DeleteAccountSubmitted()))
          .called(1);
    });

    testWidgets(
      'email text field adds [DeleteAccountEmailChanged] onChanged',
      (tester) async {
        await tester.pumpApp(
          const DeleteAccountView(),
          deleteAccountBloc: mockDeleteAccountBloc,
        );

        final emailField = find.byKey(const Key('DeleteAccountEmail'),);
        await tester.enterText(emailField, 'email');

        verify(
          () => mockDeleteAccountBloc.add(
            const DeleteAccountEmailChanged('email'),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'password text field adds [DeleteAccountPasswordChanged] onChanged',
      (tester) async {
        await tester.pumpApp(
          const DeleteAccountView(),
          deleteAccountBloc: mockDeleteAccountBloc,
        );

        final passwordField = find.byKey(const Key('DeleteAccountPassword'),);
        await tester.enterText(passwordField, 'password');

        verify(
          () => mockDeleteAccountBloc.add(
            const DeleteAccountPasswordChanged('password'),
          ),
        ).called(1);
      },
    );
  });
}
