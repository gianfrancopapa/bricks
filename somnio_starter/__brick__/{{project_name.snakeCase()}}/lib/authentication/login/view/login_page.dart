import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends Page<void> {
  const LoginPage({super.key});

  static const path = '/login';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (context) {
        return BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
          child: const LoginView(),
        );
      },
    );
  }
}
