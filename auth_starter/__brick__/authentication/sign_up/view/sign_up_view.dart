import 'package:{{package_name}}/authentication/sign_up/sign_up.dart';
import 'package:{{package_name}}/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(l10n.signUpSuccessful)),
            );
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(l10n.unknownError)),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.signUp)),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            _EmailTextField(),
            SizedBox(height: 24),
            _PasswordTextField(),
            SizedBox(height: 24),
            _ConfirmationPasswordTextField(),
            SizedBox(height: 24),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final valid = context.select((SignUpBloc bloc) => bloc.state.emailIsValid);

    return TextField(
      onChanged: (value) =>
          context.read<SignUpBloc>().add(SignUpEmailChanged(value)),
      decoration: InputDecoration(
        hintText: l10n.email,
        errorText: valid ? null : l10n.invalidEmail,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final obscurePassword =
        context.select((SignUpBloc bloc) => bloc.state.obscurePasswords);
    final valid =
        context.select((SignUpBloc bloc) => bloc.state.passwordIsValid);

    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          context.read<SignUpBloc>().add(SignUpPasswordChanged(value)),
      decoration: InputDecoration(
        hintText: l10n.password,
        errorText: valid ? null : l10n.signUpPasswordRequirement,
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context.read<SignUpBloc>().add(
                  SignUpPasswordVisibilityChanged(obscure: !obscurePassword),
                );
          },
        ),
      ),
      enableIMEPersonalizedLearning: false,
      obscureText: obscurePassword,
    );
  }
}

class _ConfirmationPasswordTextField extends StatelessWidget {
  const _ConfirmationPasswordTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final obscurePassword =
        context.select((SignUpBloc bloc) => bloc.state.obscurePasswords);
    final valid =
        context.select((SignUpBloc bloc) => bloc.state.passwordsMatch);

    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) => context.read<SignUpBloc>().add(
            SignUpConfirmationPasswordChanged(value),
          ),
      decoration: InputDecoration(
        hintText: l10n.signUpPasswordConfirmation,
        errorText: valid ? null : l10n.signUpPasswordMismatch,
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context.read<SignUpBloc>().add(
                  SignUpPasswordVisibilityChanged(obscure: !obscurePassword),
                );
          },
        ),
      ),
      enableIMEPersonalizedLearning: false,
      obscureText: obscurePassword,
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final validToSubmit = context.select((SignUpBloc bloc) => bloc.state.valid);

    return ElevatedButton(
      onPressed: validToSubmit
          ? () {
              context
                  .read<SignUpBloc>()
                  .add(const SignUpWithEmailAndPasswordRequested());
            }
          : null,
      child: Text(l10n.signUp),
    );
  }
}
