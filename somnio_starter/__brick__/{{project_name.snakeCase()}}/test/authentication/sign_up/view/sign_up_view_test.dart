import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';

import '../../../helpers/helpers.dart';

void main() {
  late SignUpBloc mockSignUpBloc;
  late NavigatorObserver mockNavigatorObserver;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
  });

  setUp(() {
    mockSignUpBloc = MockSignUpBloc();
    mockNavigatorObserver = MockNavigatorObserver();
    when(() => mockSignUpBloc.state).thenReturn(const SignUpState.initial());
  });

  group('SignUpView', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      expect(find.byType(TextField), findsNWidgets(4));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('shows success snackbar when sign up is successful',
        (WidgetTester tester) async {
      whenListen(
        mockSignUpBloc,
        Stream.fromIterable([
          const SignUpState.initial()
              .copyWith(status: FormzSubmissionStatus.success),
        ]),
      );
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('pops screen when sign up is successful',
        (WidgetTester tester) async {
      whenListen(
        mockSignUpBloc,
        Stream.fromIterable([
          const SignUpState.initial()
              .copyWith(status: FormzSubmissionStatus.success),
        ]),
      );
      await tester.pumpApp(
        Builder(
          builder: (context) {
            return SizedBox(
              child: ElevatedButton(
                child: const Text('Navigate'),
                onPressed: () => context.push(
                  '/signUpTestPath',
                ),
              ),
            );
          },
        ),
        signUpBloc: mockSignUpBloc,
        navigatorObserver: mockNavigatorObserver,
      );
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      verify(() => mockNavigatorObserver.didPop(any(), any()));
    });

    testWidgets('shows error snackbar when sign up fails',
        (WidgetTester tester) async {
      whenListen(
        mockSignUpBloc,
        Stream.fromIterable([
          const SignUpState.initial()
              .copyWith(status: FormzSubmissionStatus.failure),
        ]),
      );
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      await tester.pumpAndSettle();
      expect(find.byType(ScaffoldMessenger), findsOneWidget);
    });

    testWidgets('signUp button is disabled when form is invalid',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      await tester.pumpAndSettle();
      final signUpButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(signUpButton).enabled, isFalse);
    });

    testWidgets('signUp button is enabled when form is valid',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          email: const Email.dirty('email@mail.com'),
          password: const Password.dirty('a123456789P.'),
          confirmationPassword: 'a123456789P.',
          name: const Name.dirty('name'),
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final signUpButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(signUpButton).enabled, isTrue);
    });

    testWidgets('signUp button onPressed is called when pressed',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          email: const Email.dirty('email@mail.com'),
          password: const Password.dirty('a123456789P.'),
          confirmationPassword: 'a123456789P.',
          name: const Name.dirty('name'),
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final signUpButton = find.byType(ElevatedButton);
      await tester.tap(signUpButton);
      verify(
        () => mockSignUpBloc.add(
          const SignUpWithEmailAndPasswordRequested(),
        ),
      ).called(1);
    });

    testWidgets('should change [NameTextField] value on change',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final nameTextFieldFinder = find.byKey(
        const Key('SignUpNameTextField'),
      );
      await tester.enterText(nameTextFieldFinder, 'name');
      expect(find.text('name'), findsOneWidget);
    });

    testWidgets('[NameTextField] should display error state',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          name: const Name.dirty('@#%^&*'),
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final nameTextFieldFinder = find.byKey(
        const Key('SignUpNameTextField'),
      );
      expect(
        tester.widget<TextField>(nameTextFieldFinder).decoration?.errorText,
        isNotNull,
      );
    });

    testWidgets('should change [EmailTextField] value on change',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final emailTextFieldFinder = find.byKey(
        const Key('signUpEmailTextField'),
      );
      await tester.enterText(
        emailTextFieldFinder,
        'email@email.com',
      );

      expect(find.text('email@email.com'), findsOneWidget);
    });

    testWidgets('[EmailTextField] should display error state',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          email: const Email.dirty('email'),
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final emailTextFieldFinder = find.byKey(
        const Key('SignUpEmailTextField'),
      );
      expect(
        tester.widget<TextField>(emailTextFieldFinder).decoration?.errorText,
        isNotNull,
      );
    });

    testWidgets('should change [PasswordTextField] value on change',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          obscurePasswords: false,
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final passwordTextFieldFinder = find.byKey(
        const Key('SignUpPasswordTextField'),
      );
      await tester.enterText(
        passwordTextFieldFinder,
        'a123456789P.',
      );
      verify(
        () => mockSignUpBloc.add(
          const SignUpPasswordChanged(
            password: 'a123456789P.',
          ),
        ),
      ).called(1);
    });

    testWidgets('[PasswordTextField] should display error state',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          password: const Password.dirty('password'),
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final passwordTextFieldFinder = find.byKey(
        const Key('SignUpPasswordTextField'),
      );
      expect(
        tester.widget<TextField>(passwordTextFieldFinder).decoration?.errorText,
        isNotNull,
      );
    });

    testWidgets('should change [ConfirmationPasswordTextField] value on change',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final confirmationPasswordTextFieldFinder = find.byKey(
        const Key('SignUpConfirmationPasswordTextField'),
      );
      await tester.enterText(
        confirmationPasswordTextFieldFinder,
        'a123456789P.',
      );
      verify(
        () => mockSignUpBloc.add(
          const SignUpConfirmationPasswordChanged(
            password: 'a123456789P.',
          ),
        ),
      ).called(1);
    });

    testWidgets('[ConfirmationPasswordTextField] should display error state',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          password: const Password.dirty('password1234'),
          confirmationPassword: 'password',
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final confirmationPasswordTextFieldFinder = find.byKey(
        const Key('SignUpConfirmationPasswordTextField'),
      );

      expect(
        tester
            .widget<TextField>(confirmationPasswordTextFieldFinder)
            .decoration
            ?.errorText,
        isNotNull,
      );
    });

    testWidgets('[ConfirmationPasswordTextField] changes visibility',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          obscurePasswords: false,
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final confirmationPasswordTextFieldFinder = find.byKey(
        const Key('SignUpConfirmationPasswordTextField'),
      );

      await tester.tap(
        find.descendant(
          of: confirmationPasswordTextFieldFinder,
          matching: find.byType(IconButton),
        ),
      );

      verify(
        () => mockSignUpBloc.add(
          const SignUpPasswordVisibilityChanged(obscure: true),
        ),
      ).called(1);
    });

    testWidgets('[PasswordTextField] changes visibility',
        (WidgetTester tester) async {
      when(() => mockSignUpBloc.state).thenReturn(
        const SignUpState.initial().copyWith(
          obscurePasswords: false,
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final passwordTextFieldFinder = find.byKey(
        const Key('signUpPasswordTextField'),
      );

      await tester.tap(
        find.descendant(
          of: passwordTextFieldFinder,
          matching: find.byType(IconButton),
        ),
      );

      verify(
        () => mockSignUpBloc.add(
          const SignUpPasswordVisibilityChanged(obscure: true),
        ),
      ).called(1);
    });
  });
}
