import 'package:facebook/authentication/forgot_password/forgot_password.dart';
import 'package:facebook/authentication/login/login.dart';
import 'package:facebook/authentication/sign_up/sign_up.dart';
import 'package:facebook/down_for_maintenance/down_for_maintenance.dart';
import 'package:facebook/keys.dart';
import 'package:facebook/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => DownForMaintenanceView.showAsDialog(context),
        child: const Icon(Icons.close),
      ),
      appBar: AppBar(title: Text(l10n.logIn)),
      body: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(l10n.logInSuccessful)),
              );
          } else if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text(l10n.unknownError)),
              );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: const [
            _EmailTextField(),
            SizedBox(height: 24),
            _PasswordTextField(),
            SizedBox(height: 24),
            _LoginButton(),
            SizedBox(height: 24),
            _ForgotPasswordButton(),
            SizedBox(height: 24),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return TextButton(
      key: Keys.loginForgotPasswordButton,
      onPressed: () => context.push(ForgotPasswordPage.path),
      child: Text(l10n.forgotPassword),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      key: Keys.loginSignUpButton,
      onPressed: () => context.push(SignUpPage.path),
      child: Text(l10n.signUp),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final valid = context.select((LoginBloc bloc) {
      final email = bloc.state.email;
      return email.isValid || email.isPure;
    });

    return TextField(
      key: Keys.loginEmailTextField,
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginEmailChanged(value)),
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
        context.select((LoginBloc bloc) => bloc.state.obscurePassword);

    return TextField(
      key: Keys.loginPasswordTextField,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) =>
          context.read<LoginBloc>().add(LoginPasswordChanged(value)),
      decoration: InputDecoration(
        hintText: l10n.password,
        suffixIcon: IconButton(
          icon: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            context
                .read<LoginBloc>()
                .add(LoginPasswordVisibilityChanged(obscure: !obscurePassword));
          },
        ),
      ),
      enableIMEPersonalizedLearning: false,
      autocorrect: false,
      obscureText: obscurePassword,
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final validToSubmit = context.select((LoginBloc bloc) => bloc.state.valid);
    final l10n = context.l10n;

    return ElevatedButton(
      onPressed: validToSubmit
          ? () {
              context
                  .read<LoginBloc>()
                  .add(const LoginWithEmailAndPasswordRequested());
            }
          : null,
      child: Text(l10n.logIn),
    );
  }
}
