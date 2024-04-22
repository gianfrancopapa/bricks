import 'package:facebook/authentication/delete_account/delete_account.dart';
import 'package:facebook_ui/facebook_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete Account'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UISpacing.xlg),
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
        SizedBox(height: UISpacing.md),
        _PasswordField(),
        SizedBox(height: UISpacing.md),
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
    return UITextField.passwordTextField(
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
    return UITextField.emailTextField(
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
    final isValid =
        context.select((DeleteAccountBloc bloc) => bloc.state.valid);
    return UIOutlinedButton.primary(
      text: 'Delete Account',
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
