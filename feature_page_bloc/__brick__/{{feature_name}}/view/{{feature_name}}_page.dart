import 'package:flutter/material.dart';
import 'package:{{package_name}}/{{{path}}}/{{feature_name}}.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{feature_name.pascalCase()}}Page<T extends Object?> extends Page<T> {
  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (ctx) {
        return BlocProvider(
          create: (_) => {{feature_name.pascalCase()}}Bloc(),
          child: const {{feature_name.pascalCase()}}View(),
        );
      },
    );
  }
}