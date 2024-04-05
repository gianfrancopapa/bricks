import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/authentication/login/login.dart';

import '../../../helpers/helpers.dart';

void main() {
  late LoginBloc mockLoginBloc;

  setUp(() {
    mockLoginBloc = MockLoginBloc();
    when(() => mockLoginBloc.state).thenReturn(const LoginState.initial());
  });

  group('LoginView', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('shows success snackbar when sign up is successful',
        (WidgetTester tester) async {
      whenListen(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState.initial()
              .copyWith(status: FormzSubmissionStatus.success),
        ]),
      );

      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('shows error snackbar when sign up fails',
        (WidgetTester tester) async {
      whenListen(
        mockLoginBloc,
        Stream.fromIterable([
          const LoginState.initial()
              .copyWith(status: FormzSubmissionStatus.failure),
        ]),
      );

      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('login button is disabled when form is invalid',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      await tester.pumpAndSettle();
      final loginButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(loginButton).enabled, isFalse);
    });

    testWidgets('login button is enabled when form is valid',
        (WidgetTester tester) async {
      when(() => mockLoginBloc.state).thenReturn(
        const LoginState.initial().copyWith(
          email: const Email.dirty('email@mail.com'),
          password: const Password.dirty('Test12345.'),
        ),
      );

      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      final signUpButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(signUpButton).enabled, isTrue);
    });
  });
}
