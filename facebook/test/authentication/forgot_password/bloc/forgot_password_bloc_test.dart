import 'package:bloc_test/bloc_test.dart';
import 'package:facebook/authentication/forgot_password/forgot_password.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  group('ForgotPasswordBloc', () {
    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits [] when nothing is added',
      build: () => ForgotPasswordBloc(userRepository: mockUserRepository),
      expect: () => <ForgotPasswordState>[],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits [email] when ForgotPasswordEmailChanged is added',
      build: () => ForgotPasswordBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const ForgotPasswordEmailChanged('email')),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState.initial()
            .copyWith(email: const Email.dirty('email')),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits [ForgotPasswordStatus.loading] '
      'and [ForgotPasswordStatus.success] '
      'when ForgotPasswordSubmitted is added',
      setUp: () {
        when(
          () => mockUserRepository.forgotPassword(email: any(named: 'email')),
        ).thenAnswer((_) async {});
      },
      build: () => ForgotPasswordBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const ForgotPasswordSubmitted()),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState.initial().copyWith(
          status: ForgotPasswordStatus.loading,
        ),
        const ForgotPasswordState.initial().copyWith(
          status: ForgotPasswordStatus.success,
        ),
      ],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits [ForgotPasswordStatus.loading] '
      'and [ForgotPasswordStatus.error] '
      'when ForgotPasswordSubmitted is added',
      setUp: () {
        when(
          () => mockUserRepository.forgotPassword(email: any(named: 'email')),
        ).thenThrow(Exception());
      },
      build: () => ForgotPasswordBloc(userRepository: mockUserRepository),
      act: (bloc) => bloc.add(const ForgotPasswordSubmitted()),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState.initial().copyWith(
          status: ForgotPasswordStatus.loading,
        ),
        const ForgotPasswordState.initial().copyWith(
          status: ForgotPasswordStatus.error,
        ),
      ],
    );
  });
}
