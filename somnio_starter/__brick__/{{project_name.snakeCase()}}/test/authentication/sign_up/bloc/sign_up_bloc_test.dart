import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  group('SignUpBloc', () {
    blocTest<SignUpBloc, SignUpState>(
      'emits [] when nothing is added',
      build: () => SignUpBloc(userRepository: mockUserRepository),
      expect: () => <SignUpState>[],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [email] when SignUpEmailChanged is added',
      build: () => SignUpBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const SignUpEmailChanged('email')),
      expect: () => <SignUpState>[
        const SignUpState.initial().copyWith(email: const Email.dirty('email')),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [password] when SignUpPasswordChanged is added',
      build: () => SignUpBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const SignUpPasswordChanged('password')),
      expect: () => <SignUpState>[
        const SignUpState.initial()
            .copyWith(password: const Password.dirty('password')),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [confirmationPassword] when '
      'SignUpConfirmationPasswordChanged is added',
      build: () => SignUpBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc
          .add(const SignUpConfirmationPasswordChanged('confirmationPassword')),
      expect: () => <SignUpState>[
        const SignUpState.initial().copyWith(
          confirmationPassword: 'confirmationPassword',
        ),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [obscurePasswords] as true '
      'when SignUpPasswordVisibilityChanged is added',
      build: () => SignUpBloc(userRepository: mockUserRepository),
      act: (bloc) =>
          bloc.add(const SignUpPasswordVisibilityChanged(obscure: true)),
      expect: () => <SignUpState>[
        const SignUpState.initial().copyWith(
          obscurePasswords: true,
        ),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [obscurePasswords] as false '
      'when SignUpPasswordVisibilityChanged is added',
      build: () => SignUpBloc(userRepository: mockUserRepository),
      act: (bloc) =>
          bloc.add(const SignUpPasswordVisibilityChanged(obscure: false)),
      expect: () => <SignUpState>[
        const SignUpState.initial().copyWith(
          obscurePasswords: false,
        ),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits [FormzSubmissionStatus.inProgress] '
      'and [FormzSubmissionStatus.success] '
      'when SignUpWithEmailAndPasswordRequested is added',
      setUp: () {
        when(
          () => mockUserRepository.signUp(
            email: any<String>(named: 'email'),
            password: any<String>(named: 'password'),
            name: any<String>(named: 'name'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => SignUpBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const SignUpWithEmailAndPasswordRequested()),
      expect: () => <SignUpState>[
        const SignUpState.initial()
            .copyWith(status: FormzSubmissionStatus.inProgress),
        const SignUpState.initial()
            .copyWith(status: FormzSubmissionStatus.success),
      ],
    );
  });
}
