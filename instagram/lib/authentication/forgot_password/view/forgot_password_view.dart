import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/authentication/forgot_password/forgot_password.dart';
import 'package:instagram/l10n/l10n.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        final l10n = context.l10n;

        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(l10n.resetSuccessful)),
            );
        }
        if (state.status.isError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(l10n.unknownError)),
            );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: const _ForgotPasswordForm(),
      ),
    );
  }
}

class _ForgotPasswordForm extends StatelessWidget {
  const _ForgotPasswordForm();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status =
        context.select((ForgotPasswordBloc bloc) => bloc.state.status);

    if (status == ForgotPasswordStatus.loading) {
      return const Placeholder();
    }
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text(l10n.forgotPasswordDescription),
        const SizedBox(height: 8),
        const _EmailTextField(),
        const SizedBox(height: 24),
        const _ResetButton(),
        const SizedBox(height: 24),
      ],
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final valid = context.select((ForgotPasswordBloc bloc) => bloc.state.valid);

    return ElevatedButton(
      onPressed: valid
          ? () {
              context
                  .read<ForgotPasswordBloc>()
                  .add(const ForgotPasswordSubmitted());
            }
          : null,
      child: Text(l10n.reset),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final valid = context.select((ForgotPasswordBloc bloc) => bloc.state.valid);

    return TextField(
      onChanged: (email) => context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordEmailChanged(email)),
      decoration: InputDecoration(
        hintText: l10n.email,
        errorText: valid ? null : l10n.invalidEmail,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
