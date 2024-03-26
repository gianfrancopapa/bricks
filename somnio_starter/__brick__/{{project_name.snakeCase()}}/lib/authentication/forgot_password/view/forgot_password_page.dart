import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';

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
