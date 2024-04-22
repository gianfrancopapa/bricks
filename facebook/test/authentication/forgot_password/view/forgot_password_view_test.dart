import 'package:bloc_test/bloc_test.dart';
import 'package:facebook/authentication/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/helpers.dart';

void main() {
  late ForgotPasswordBloc mockForgotPasswordBloc;

  setUp(() {
    mockForgotPasswordBloc = MockForgotPasswordBloc();
    when(() => mockForgotPasswordBloc.state)
        .thenReturn(const ForgotPasswordState.initial());
  });

  group('SignUpView', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      expect(find.byType(TextField), findsNWidgets(1));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('shows success snackbar when reset is successful',
        (WidgetTester tester) async {
      whenListen(
        mockForgotPasswordBloc,
        Stream.fromIterable([
          const ForgotPasswordState.initial()
              .copyWith(status: ForgotPasswordStatus.success),
        ]),
      );
      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('shows error snackbar when reset fails',
        (WidgetTester tester) async {
      whenListen(
        mockForgotPasswordBloc,
        Stream.fromIterable([
          const ForgotPasswordState.initial()
              .copyWith(status: ForgotPasswordStatus.error),
        ]),
      );
      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('reset button is disabled when form is invalid',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      await tester.pumpAndSettle();
      final resetButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(resetButton).enabled, isFalse);
    });

    testWidgets('reset button is enabled when form is valid',
        (WidgetTester tester) async {
      whenListen(
        mockForgotPasswordBloc,
        Stream.fromIterable([
          const ForgotPasswordState.initial()
              .copyWith(email: const Email.dirty('mail@mail.com')),
        ]),
      );

      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      final resetButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(resetButton).enabled, isTrue);
    });

    testWidgets('should call [ForgotPasswordSubmitted] on reset button press',
        (WidgetTester tester) async {
      when(() => mockForgotPasswordBloc.state).thenReturn(
        const ForgotPasswordState.initial().copyWith(
          email: const Email.dirty('test@example.com'),
        ),
      );

      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      final resetButton = find.byType(ElevatedButton);
      await tester.tap(resetButton);

      verify(
        () => mockForgotPasswordBloc.add(
          const ForgotPasswordSubmitted(),
        ),
      ).called(1);
    });

    testWidgets('should call [ForgotPasswordEmailChanged] on email change',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const ForgotPasswordView(),
        forgotPasswordBloc: mockForgotPasswordBloc,
      );

      final emailField = find.byType(TextField);
      await tester.enterText(emailField, 'test@example.com');

      verify(
        () => mockForgotPasswordBloc.add(
          const ForgotPasswordEmailChanged('test@example.com'),
        ),
      ).called(1);
    });
  });
}
