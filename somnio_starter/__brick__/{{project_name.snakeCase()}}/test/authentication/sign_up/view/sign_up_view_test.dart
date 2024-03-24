import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';

import '../../../helpers/helpers.dart';

void main() {
  late SignUpBloc mockSignUpBloc;

  setUp(() {
    mockSignUpBloc = MockSignUpBloc();
    when(() => mockSignUpBloc.state).thenReturn(const SignUpState.initial());
  });

  group('SignUpView', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      expect(find.byType(TextField), findsNWidgets(3));
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
        ),
      );

      await tester.pumpApp(
        const SignUpView(),
        signUpBloc: mockSignUpBloc,
      );

      final signUpButton = find.byType(ElevatedButton);
      expect(tester.widget<ElevatedButton>(signUpButton).enabled, isTrue);
    });
  });
}
