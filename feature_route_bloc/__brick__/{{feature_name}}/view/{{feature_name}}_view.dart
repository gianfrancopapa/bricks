import 'package:flutter/material.dart';
import 'package:{{package_name}}/{{{path}}}/{{feature_name}}.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{feature_name.pascalCase()}}View({Key? key}) : super(key: key);

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
        body: const _{{feature_name.pascalCase()}}Form(),
      ),
    );
  }
}

class _{{feature_name.pascalCase()}}Form extends StatelessWidget {
  const _{{feature_name.pascalCase()}}Form();

  @override
  Widget build(BuildContext context) {
    final status = context.select(({{feature_name.pascalCase()}}Bloc bloc) => bloc.state.status);

    if (status == {{feature_name.pascalCase()}}Status.loading) {
      return const Placeholder();
    }
    return const Placeholder();
  }
}
