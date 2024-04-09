import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/delete_account/delete_account.dart';

class DeleteAccountPage extends Page<void> {
  const DeleteAccountPage();
  static const path = '/delete-account';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (ctx) {
        return BlocProvider(
          create: (_) => DeleteAccountBloc(),
          child: const DeleteAccountView(),
        );
      },
    );
  }
}
