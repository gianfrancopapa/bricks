import 'package:facebook/authentication/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends Page<void> {
  static const path = '/forgot_password';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (ctx) {
        return BlocProvider(
          create: (_) => ForgotPasswordBloc(
            userRepository: context.read(),
          ),
          child: const ForgotPasswordView(),
        );
      },
    );
  }
}
