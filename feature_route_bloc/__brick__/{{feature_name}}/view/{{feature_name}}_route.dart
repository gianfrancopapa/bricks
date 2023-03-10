import 'package:flutter/material.dart';
import 'package:{{package_name}}/{{{path}}}/{{feature_name}}.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{feature_name.pascalCase()}}Route extends StatelessWidget {
  const {{feature_name.pascalCase()}}Route({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => {{feature_name.pascalCase()}}Bloc(),
          child: const {{feature_name.pascalCase()}}Route(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const {{feature_name.pascalCase()}}View();
  }
}