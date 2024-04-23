import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/l10n/l10n.dart';
import 'package:{{project_name}}_ui/{{project_name}}_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  App({
    required UserRepository userRepository,
    required User? user,
    super.key,
  })  : _user = user,
        _routerConfig = AppRouter.router(),
        _userRepository = userRepository;

  final User? _user;
  final UserRepository _userRepository;
  final GoRouter _routerConfig;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          userRepository: _userRepository,
          user: _user,
        ),
        child: AppView(
          routerConfig: _routerConfig,
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    required GoRouter routerConfig,
    super.key,
  }) : _routerConfig = routerConfig;

  final GoRouter _routerConfig;

  @override
  Widget build(BuildContext context) {
    return AuthStreamScope(
      appBloc: context.read<AppBloc>(),
      child: MaterialApp.router(
        theme: UITheme().lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _routerConfig,
        title: '{{project_name}}',
      ),
    );
  }
}
