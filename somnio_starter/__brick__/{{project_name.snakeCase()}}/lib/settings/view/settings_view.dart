import 'package:flutter/material.dart';
import 'package:{{project_name}}/settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state.status == SettingsStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: const _SettingsForm(),
      ),
    );
  }
}

class _SettingsForm extends StatelessWidget {
  const _SettingsForm();

  @override
  Widget build(BuildContext context) {
    final status = context.select((SettingsBloc bloc) => bloc.state.status);

    if (status == SettingsStatus.loading) {
      return const Placeholder();
    }
    return const Placeholder();
  }
}
