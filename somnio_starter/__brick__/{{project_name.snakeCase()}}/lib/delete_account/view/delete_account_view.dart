import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';

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

    return {{short_name.upperCase()}}TextField.passwordTextField(
      initialValue: password,
      onChanged: (password) {
        context.read<DeleteAccountBloc>().add(
              DeleteAccountPasswordChanged(password),
            );
      },
      hintText: context.l10n.password,
      icon: FeatherIcons.lock,
    );
  }
}