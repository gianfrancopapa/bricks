import 'package:{{project_name}}/authentication/delete_account/delete_account.dart';
import 'package:{{project_name}}_ui/{{project_name}}_ui.dart';
import 'package:{{project_name}}/keys.dart';
import 'package:{{project_name}}/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.deleteAccount),
        leading: const BackButton(),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all({{short_name.upperCase()}}Spacing.xlg),
          child: DeleteAccountForm(),
        ),
      ),
    );
  }
}

class DeleteAccountForm extends StatelessWidget {
  const DeleteAccountForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _EmailField(),
        SizedBox(height: {{short_name.upperCase()}}Spacing.md),
        _PasswordField(),
        SizedBox(height: {{short_name.upperCase()}}Spacing.md),
        _DeleteAccountButton(),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  const _PasswordField();

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  @override
  Widget build(BuildContext context) {
    final password = context.select(
      (DeleteAccountBloc bloc) => bloc.state.password,
    );
    final initialValue = password.value;
    return {{short_name.upperCase()}}TextField.passwordTextField(
      key: Keys.deleteAccountPassword,
      initialValue: initialValue,
      onChanged: (password) {
        context.read<DeleteAccountBloc>().add(
              DeleteAccountPasswordChanged(password),
            );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final email = context.read<DeleteAccountBloc>().state.email;
    final initialValue = email.value;
    return {{short_name.upperCase()}}TextField.emailTextField(
      key: Keys.deleteAccountEmail,
      initialValue: initialValue,
      onChanged: (email) {
        context.read<DeleteAccountBloc>().add(
              DeleteAccountEmailChanged(email),
            );
      },
    );
  }
}

class _DeleteAccountButton extends StatelessWidget {
  const _DeleteAccountButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isValid =
        context.select((DeleteAccountBloc bloc) => bloc.state.valid);

    return {{short_name.upperCase()}}OutlinedButton.primary(
      text: l10n.deleteAccount,
      onPressed: isValid
          ? () {
              context.read<DeleteAccountBloc>().add(
                    const DeleteAccountSubmitted(),
                  );
            }
          : null,
    );
  }
}
