import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{package_name}}/{{{path}}}/{{feature_name}}.dart';

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
      listener: (context, state) {
        if (state.status == {{feature_name.pascalCase()}}Status.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: const _{{feature_name.pascalCase()}}Widget(),
      ),
    );
  }
}

class _{{feature_name.pascalCase()}}Widget extends StatelessWidget {
  const _{{feature_name.pascalCase()}}Widget();

  @override
  Widget build(BuildContext context) {
    final status = context.select(({{feature_name.pascalCase()}}Bloc bloc) => bloc.state.status);

    if (status == {{feature_name.pascalCase()}}Status.loading) {
      return const CircularProgressIndicator();
    }
    return const Placeholder();
  }
}
