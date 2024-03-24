import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';

void main() {
  group('ForgotPasswordBloc', () {
    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits [] when nothing is added',
      build: ForgotPasswordBloc.new,
      expect: () => <ForgotPasswordState>[],
    );

    blocTest<ForgotPasswordBloc, ForgotPasswordState>(
      'emits [email] when ForgotPasswordEmailChanged is added',
      build: ForgotPasswordBloc.new,
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
      build: ForgotPasswordBloc.new,
      act: (bloc) => bloc.add(const ForgotPasswordSubmitted()),
      expect: () => <ForgotPasswordState>[
        const ForgotPasswordState.initial()
            .copyWith(status: ForgotPasswordStatus.loading),
        const ForgotPasswordState.initial()
            .copyWith(status: ForgotPasswordStatus.success),
      ],
    );
  });
}
