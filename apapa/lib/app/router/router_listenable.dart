import 'dart:async';

import 'package:apapa/app/app.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

class AuthListenable extends ValueNotifier<User?> {
  AuthListenable({
    required AppBloc appBloc,
    User? user,
  })  : _appBloc = appBloc,
        super(user) {
    _userSubscription = _appBloc.stream
        .map((state) => (user: state.user))
        .distinct()
        .listen((tuple) => notifyListeners());
  }

  final AppBloc _appBloc;
  late final StreamSubscription<({User? user})?> _userSubscription;

  @override
  User? get value {
    return _appBloc.state.user;
  }

  @override
  void dispose() {
    unawaited(_userSubscription.cancel());
    super.dispose();
  }
}
