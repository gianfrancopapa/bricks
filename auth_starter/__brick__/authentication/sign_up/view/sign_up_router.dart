import 'package:auth_example/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends Page<void> {
  const SignUpPage();

  static const path = '/sign-in';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider(
          create: (_) => SignUpBloc(),
          child: const SignUpView(),
        );
      },
    );
  }
}
