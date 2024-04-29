import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/settings/settings.dart';

class SettingsPage extends Page<void> {
  const SettingsPage();
  static const path = '/settings';

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      settings: this,
      builder: (ctx) {
        return BlocProvider(
          create: (_) => SettingsBloc()
            ..add(
              const VersionNumberRetrieved(),
            ),
          child: const SettingsView(),
        );
      },
    );
  }
}
