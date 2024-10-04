import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temp/authentication/login/login.dart';
import 'package:user_repository/user_repository.dart';

import '../../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });
  group('LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
      'emits [] when nothing is added',
      build: () => LoginBloc(userRepository: mockUserRepository),
      expect: () => <LoginState>[],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [email] when LoginEmailChanged is added',
      build: () => LoginBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const LoginEmailChanged('email')),
      expect: () => <LoginState>[
        const LoginState.initial().copyWith(email: const Email.dirty('email')),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [password] when LoginPasswordChanged is added',
      build: () => LoginBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const LoginPasswordChanged('password')),
      expect: () => <LoginState>[
        const LoginState.initial()
            .copyWith(password: const Password.dirty('password')),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [obscure] as true when LoginPasswordVisibilityChanged is added',
      build: () => LoginBloc(userRepository: mockUserRepository),
      act: (bloc) =>
          bloc.add(const LoginPasswordVisibilityChanged(obscure: true)),
      expect: () => <LoginState>[
        const LoginState.initial().copyWith(obscurePassword: true),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [obscure] as false when LoginPasswordVisibilityChanged is added',
      build: () => LoginBloc(userRepository: mockUserRepository),
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
      setUp: () {
        when(
          () => mockUserRepository.signIn(
            email: any<String>(named: 'email'),
            password: any<String>(named: 'password'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => LoginBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const LoginWithEmailAndPasswordRequested()),
      expect: () => <LoginState>[
        const LoginState.initial()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const LoginState.initial()
            .copyWith(status: FormzSubmissionStatus.success),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [FormzSubmissionStatus.inProgress] '
      'and [FormzSubmissionStatus.failure] '
      'when LoginWithEmailAndPasswordRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.signIn(
            email: any<String>(named: 'email'),
            password: any<String>(named: 'password'),
          ),
        ).thenThrow(Exception());
      },
      build: () => LoginBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const LoginWithEmailAndPasswordRequested()),
      expect: () => <LoginState>[
        const LoginState.initial()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const LoginState.initial()
            .copyWith(status: FormzSubmissionStatus.failure),
      ],
    );
  });
}
