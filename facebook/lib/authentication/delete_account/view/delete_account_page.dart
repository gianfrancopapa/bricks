import 'package:facebook/authentication/delete_account/delete_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

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
          create: (_) => DeleteAccountBloc(
            userRepository: ctx.read<UserRepository>(),
          ),
          child: const DeleteAccountView(),
        );
      },
    );
  }
}
