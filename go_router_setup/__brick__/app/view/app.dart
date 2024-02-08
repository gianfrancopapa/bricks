import 'package:flutter/material.dart';
import 'package:{{package_name.snakeCase()}}/app/app.dart';
import 'package:{{package_name.snakeCase()}}/l10n/l10n.dart';
import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: {{short_name.upperCase()}}Theme().lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.router(),
    );
  }
}
