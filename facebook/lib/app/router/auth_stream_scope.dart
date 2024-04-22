import 'dart:async';

import 'package:facebook/app/app.dart';
import 'package:flutter/material.dart';

class AuthStreamScope extends InheritedNotifier<AuthStream> {
  AuthStreamScope({
    required AppBloc appBloc,
    required super.child,
    super.key,
  }) : super(notifier: AuthStream(appBloc, appBloc.stream));

  static AuthStream of(BuildContext ctx) =>
      ctx.dependOnInheritedWidgetOfExactType<AuthStreamScope>()!.notifier!;
}

class AuthStream extends ChangeNotifier {
  AuthStream(
    AppBloc bloc,
    Stream<dynamic> stream,
  ) : _bloc = bloc {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  final AppBloc _bloc;
  late final StreamSubscription<dynamic> _subscription;

  bool get isSignedIn => _bloc.state.status == AppStatus.authenticated;
  bool get isSignedOut => _bloc.state.status == AppStatus.unauthenticated;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
