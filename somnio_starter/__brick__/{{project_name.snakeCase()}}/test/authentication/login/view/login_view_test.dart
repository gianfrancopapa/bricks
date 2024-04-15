import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:{{project_name}}/keys.dart';

import '../../../helpers/helpers.dart';

void main() {
  late LoginBloc mockLoginBloc;
  late NavigatorObserver mockNavigatorObserver;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  setUp(() {
    mockLoginBloc = MockLoginBloc();
    mockNavigatorObserver = MockNavigatorObserver();

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

    testWidgets(
        'adds [LoginWithEmailAndPasswordRequested]'
        ' when login button is pressed', (WidgetTester tester) async {
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

      final loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      verify(
        () => mockLoginBloc.add(const LoginWithEmailAndPasswordRequested()),
      ).called(1);
    });

    testWidgets(
        'adds [LoginPasswordChanged] when password textfield is changed',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      final passwordTextField = find.byKey(Keys.loginPasswordTextField);
      await tester.enterText(passwordTextField, 'Test12345.');

      verify(
        () => mockLoginBloc.add(
          const LoginPasswordChanged('Test12345.'),
        ),
      ).called(1);
    });

    testWidgets(
        'changes visibility when [PasswordTextField] icon '
        ' is tapped', (WidgetTester tester) async {
      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      final passwordTextField = find.byKey(Keys.loginPasswordTextField);

      await tester.tap(
        find.descendant(
          of: passwordTextField,
          matching: find.byType(IconButton),
        ),
      );

      verify(
        () => mockLoginBloc.add(
          const LoginPasswordVisibilityChanged(obscure: false),
        ),
      ).called(1);
    });

    testWidgets('[EmailTextField] should display error state',
        (WidgetTester tester) async {
      when(() => mockLoginBloc.state).thenReturn(
        const LoginState.initial().copyWith(
          email: const Email.dirty('asd'),
        ),
      );

      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      final emailTextField = find.byKey(Keys.loginEmailTextField);
      expect(
        tester.widget<TextField>(emailTextField).decoration?.errorText,
        isNotNull,
      );
    });

    testWidgets('[EmailTextField] should add [LoginEmailChanged] event',
        (WidgetTester tester) async {
      when(() => mockLoginBloc.state).thenReturn(
        const LoginState.initial().copyWith(
          email: const Email.dirty('asd'),
        ),
      );

      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
      );

      final emailTextField = find.byKey(Keys.loginEmailTextField);
      await tester.enterText(emailTextField, 'email');

      verify(
        () => mockLoginBloc.add(
          const LoginEmailChanged('email'),
        ),
      ).called(1);
    });

    testWidgets('[ForgotPasswordButton] navigates on pressed',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
        navigatorObserver: mockNavigatorObserver,
      );

      final forgotPasswordButton = find.byKey(Keys.loginForgotPasswordButton);
      await tester.tap(forgotPasswordButton);
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });

    testWidgets('[SignUpButton] navigates on pressed',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const LoginView(),
        loginBloc: mockLoginBloc,
        navigatorObserver: mockNavigatorObserver,
      );

      final signUpButton = find.byKey(Keys.loginSignUpButton);
      await tester.tap(signUpButton);
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });
  });
}
