import 'package:flutter/material.dart';
import 'package:{{package_name}}/{{{path}}}/{{feature_name}}.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{feature_name.pascalCase()}}View extends StatelessWidget {
  const {{#pascalCase}}{{feature_name}}{{/pascalCase}}View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
      listenWhen: (previous, current) => current.status == {{feature_name.pascalCase()}}Status.error,
      listener: (BuildContext context, {{feature_name.pascalCase()}}State state) {
        if (state.status == {{feature_name.pascalCase()}}Status.error) {
          //handel error
        }
      },
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (BuildContext context, {{feature_name.pascalCase()}}State state) {
        if(state.status == {{feature_name.pascalCase()}}Status.initial){
          return Container();
        }
        return Container();
      },
    );
  }
}