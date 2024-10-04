import 'dart:async';

import 'package:temp/app/app.dart';
import 'package:flutter/material.dart';

class AppStatusStreamScope extends InheritedNotifier<AppStatusStream> {
  AppStatusStreamScope({
    required AppBloc appBloc,
    required super.child,
    super.key,
  }) : super(notifier: AppStatusStream(appBloc, appBloc.stream));

  static AppStatusStream of(BuildContext ctx) =>
      ctx.dependOnInheritedWidgetOfExactType<AppStatusStreamScope>()!.notifier!;
}

class AppStatusStream extends ChangeNotifier {
  AppStatusStream(
    AppBloc bloc,
    Stream<dynamic> stream,
  ) : _bloc = bloc {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  final AppBloc _bloc;
  late final StreamSubscription<dynamic> _subscription;

  bool get isSignedIn => _bloc.state.status == AppStatus.authenticated;
  bool get isSignedOut => _bloc.state.status == AppStatus.unauthenticated;
  bool get isDownForMaintenance =>
      _bloc.state.status == AppStatus.downForMaintenance;
  bool get forceUpgrade => _bloc.state.status == AppStatus.forceUpgrade;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
