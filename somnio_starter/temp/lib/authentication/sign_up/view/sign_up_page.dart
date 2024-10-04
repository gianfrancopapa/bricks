import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp/authentication/sign_up/sign_up.dart';

class SignUpPage extends Page<void> {
  const SignUpPage();

  static const path = '/sign-up';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider(
          create: (_) => SignUpBloc(userRepository: context.read()),
          child: const SignUpView(),
        );
      },
    );
  }
}
