import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:{{project_name}}/authentication/login/login.dart';

void main() {
  group('LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
      'emits [] when nothing is added',
      build: LoginBloc.new,
      expect: () => <LoginState>[],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [email] when LoginEmailChanged is added',
      build: LoginBloc.new,
      act: (bloc) => bloc.add(const LoginEmailChanged('email')),
      expect: () => <LoginState>[
        const LoginState.initial().copyWith(email: const Email.dirty('email')),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [password] when LoginPasswordChanged is added',
      build: LoginBloc.new,
      act: (bloc) => bloc.add(const LoginPasswordChanged('password')),
      expect: () => <LoginState>[
        const LoginState.initial()
            .copyWith(password: const Password.dirty('password')),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [obscure] as true when LoginPasswordVisibilityChanged is added',
      build: LoginBloc.new,
      act: (bloc) =>
          bloc.add(const LoginPasswordVisibilityChanged(obscure: true)),
      expect: () => <LoginState>[
        const LoginState.initial().copyWith(obscurePassword: true),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [obscure] as false when LoginPasswordVisibilityChanged is added',
      build: LoginBloc.new,
      act: (bloc) =>
          bloc.add(const LoginPasswordVisibilityChanged(obscure: false)),
      expect: () => <LoginState>[
        const LoginState.initial().copyWith(obscurePassword: false),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [FormzSubmissionStatus.inProgress] '
      'and [FormzSubmissionStatus.success] '
      'when LoginWithEmailAndPasswordRequested is added',
      build: LoginBloc.new,
      act: (bloc) => bloc.add(const LoginWithEmailAndPasswordRequested()),
      expect: () => <LoginState>[
        const LoginState.initial()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const LoginState.initial()
            .copyWith(status: FormzSubmissionStatus.success),
      ],
    );
  });
}
