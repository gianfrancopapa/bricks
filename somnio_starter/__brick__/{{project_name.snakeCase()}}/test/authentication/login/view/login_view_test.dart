import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';

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
      expect(find.byType({{short_name.upperCase()}}OutlinedButton), findsOneWidget);
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
      final loginButton = find.byType(OutlinedButton);
      expect(tester.widget<OutlinedButton>(loginButton).enabled, isFalse);
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

      final signUpButton = find.byType(OutlinedButton);
      expect(tester.widget<OutlinedButton>(signUpButton).enabled, isTrue);
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

      final loginButton = find.byType(OutlinedButton);
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

      final passwordTextField = find.byKey(
        const Key('LoginPasswordTextField'),
      );
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

      final passwordTextField = find.byKey(
        const Key('LoginPasswordTextField'),
      );

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

      final emailTextField = find
          .byKey(const Key('LoginEmailTextField'))
          .evaluate()
          .where((element) => element.widget is {{short_name.upperCase()}}TextField)
          .single;

      expect(emailTextField, isNotNull);

      await tester.pump();

      final textFieldWidget = emailTextField.widget as {{short_name.upperCase()}}TextField;
      expect(textFieldWidget.errorText, isNotNull);
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

      final emailTextField = find.byKey(
        const Key('LoginEmailTextField'),
      );
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

      final forgotPasswordButton = find.byKey(
        const Key('LoginForgotPasswordButton'),
      );
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

      final signUpButton = find.byKey(
        const Key('LoginSignUpButton'),
      );
      await tester.tap(signUpButton);
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });
  });
}
