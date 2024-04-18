import 'package:apapa/app/app.dart';
import 'package:apapa/l10n/l10n.dart';
import 'package:apapa_ui/apapa_ui.dart';
import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required UserRepository userRepository,
    required OnCreateRouter onCreateRouter,  
    required AppConfigRepository appConfigRepository,
    required User? user,
    super.key,
  })  : _user = user,
        _onCreateRouter = onCreateRouter,
        _userRepository = userRepository,
        _appConfigRepository = appConfigRepository;

  final OnCreateRouter _onCreateRouter;
  final User? _user;
  final UserRepository _userRepository;
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
        ),
        child: AppView(onCreateRouter: _onCreateRouter, user: _user),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    required OnCreateRouter onCreateRouter,
    required User? user,
    super.key,
  })  : _onCreateRouter = onCreateRouter,
        _user = user;

  final OnCreateRouter _onCreateRouter;
  final User? _user;

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    return MaterialApp.router(
      theme: UITheme().lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _onCreateRouter(
        user: _user,
        authListenable: appBloc.toAuthListenable(user: _user),
      ),
      title: 'apapa',
    );
  }
}
