import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/l10n/l10n.dart';
import 'package:{{project_name}}_ui/{{project_name}}_ui.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required UserRepository userRepository,
    required OnCreateRouter onCreateRouter,
    required User? user,
    super.key,
  })  : _user = user,
        _onCreateRouter = onCreateRouter,
        _userRepository = userRepository;

  final OnCreateRouter _onCreateRouter;

  final User? _user;

  final UserRepository _userRepository;

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
      theme: {{short_name.upperCase()}}Theme().lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _onCreateRouter(
        user: _user,
        authListenable: appBloc.toAuthListenable(user: _user),
      ),
      title: '{{project_name}}',
    );
  }
}
