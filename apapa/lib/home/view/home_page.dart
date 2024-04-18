import 'package:apapa/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends Page<void> {
  const HomePage();
  static const path = '/home';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (ctx) {
        return BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomeView(),
        );
      },
    );
  }
}
