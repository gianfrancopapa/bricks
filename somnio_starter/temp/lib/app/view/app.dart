import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temp/app/app.dart';
import 'package:temp/l10n/l10n.dart';
import 'package:temp_ui/temp_ui.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  App({
    required UserRepository userRepository,
    required User? user,
    required AppConfigRepository appConfigRepository,
    super.key,
  })  : _user = user,
        _appConfigRepository = appConfigRepository,
        _routerConfig = AppRouter.router(),
        _userRepository = userRepository;

  final User? _user;
  final UserRepository _userRepository;
  final GoRouter _routerConfig;
  final AppConfigRepository _appConfigRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _userRepository),
        RepositoryProvider.value(value: _appConfigRepository),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          userRepository: _userRepository,
          user: _user,
          appConfigRepository: _appConfigRepository,
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
    return AppStatusStreamScope(
      appBloc: context.read<AppBloc>(),
      child: MaterialApp.router(
        theme: UITheme().lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _routerConfig,
        title: 'temp',
      ),
    );
  }
}
