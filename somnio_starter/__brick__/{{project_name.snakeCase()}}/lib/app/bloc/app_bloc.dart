import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required User? user,
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(
          user == null
              ? const AppState.unauthenticated()
              : AppState.authenticated(user: user),
        ) {
    on<AppUserChanged>(_onAppUserChanged);
    on<AppDownForMaintenanceStatusChanged>(
      _onAppDownForMaintenanceStatusChanged,
    );
    on<AppLogoutRequested>(_onAppLogoutRequested);
    _userSubscription = _userRepository.user.listen(_onUser);
  }

  final UserRepository _userRepository;
  late final StreamSubscription<User?> _userSubscription;

  void _onUser(User? user) {
    add(AppUserChanged(user: user));
  }

  Future<void> _onAppUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    final user = event.user;
    if (user == null) {
      emit(const AppState.unauthenticated());
    } else {
      emit(AppState.authenticated(user: user));
    }
  }

  void _onAppDownForMaintenanceStatusChanged(
    AppDownForMaintenanceStatusChanged event,
    Emitter<AppState> emit,
  ) {
    final isDownForMaintenance = event.isDownForMaintenance;
    if (isDownForMaintenance) {
      return emit(AppState.downForMaintenance(user: state.user));
    }

    if (!state.status.isDownForMaintenance) return;

    if (state.user == null) {
      emit(const AppState.unauthenticated());
    } else {
      emit(AppState.authenticated(user: state.user!));
    }
  }

  void _onAppLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) {
    if (state.user == null) return;
    unawaited(_userRepository.signOut());
  }

  @override
  Future<void> close() {
    unawaited(_userSubscription.cancel());
    return super.close();
  }
}
