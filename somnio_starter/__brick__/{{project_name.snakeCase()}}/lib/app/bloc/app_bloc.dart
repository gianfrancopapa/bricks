import 'dart:async';

import 'package:app_config_repository/app_config_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';


part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required User? user,
    required UserRepository userRepository,
    required AppConfigRepository appConfigRepository,
  })  : _userRepository = userRepository,
        super(
          user == null
              ? const AppState.unauthenticated(
                  forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
                  isDownForMaintenance: false,
                )
              : AppState.authenticated(
                  user: user,
                  forceUpgrade: const ForceUpgrade(isUpgradeRequired: false),
                  isDownForMaintenance: false,
                ),
        ) {
    on<AppUserChanged>(_onAppUserChanged);
    on<AppDownForMaintenanceStatusChanged>(
      _onAppDownForMaintenanceStatusChanged,
    );
    on<AppLogoutRequested>(_onAppLogoutRequested);
    on<AppForceUpgradeStatusChanged>(_onAppForceUpgradeStatusChanged);
    _userSubscription = _userRepository.user.listen(_onUser);
    _forceUpgradeSubscription = appConfigRepository
        .isForceUpgradeRequired()
        .listen(_forceUpgradeStatusChanged);
    _isDownForMaintenanceSubscription = appConfigRepository
        .isDownForMaintenance()
        .listen(_downForMaintenanceStatusChanged);
  }

  final UserRepository _userRepository;
  late final StreamSubscription<User?> _userSubscription;
  late StreamSubscription<ForceUpgrade> _forceUpgradeSubscription;
  late StreamSubscription<bool> _isDownForMaintenanceSubscription;

  void _onUser(User? user) {
    add(AppUserChanged(user: user));
  }
    void _downForMaintenanceStatusChanged(bool isDownForMaintenance) {
    add(AppDownForMaintenanceStatusChanged(
      isDownForMaintenance: isDownForMaintenance,
    ),);
  }

  void _forceUpgradeStatusChanged(ForceUpgrade forceUpgrade) {
    add(AppForceUpgradeStatusChanged(forceUpgrade));
  }

  Future<void> _onAppUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    final user = event.user;
    if (user == null) {
      emit(
        AppState.unauthenticated(
          forceUpgrade: state.forceUpgrade,
          isDownForMaintenance: state.isDownForMaintenance,
        ),
      );
    } else {
      emit(
        AppState.authenticated(
          user: user,
          forceUpgrade: state.forceUpgrade,
          isDownForMaintenance: state.isDownForMaintenance,
        ),
      );
    }
  }

  void _onAppDownForMaintenanceStatusChanged(
    AppDownForMaintenanceStatusChanged event,
    Emitter<AppState> emit,
  ) {
    final isDownForMaintenance = event.isDownForMaintenance;
    if (isDownForMaintenance) {
      emit(
        AppState.downForMaintenance(
          user: state.user,
          forceUpgrade: state.forceUpgrade,
          isDownForMaintenance: isDownForMaintenance,
        ),
      );
    }
  }
  Future<void> _onAppForceUpgradeStatusChanged(
    AppForceUpgradeStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    final forceUpgrade = event.forceUpgrade;
    if (forceUpgrade.isUpgradeRequired) {
      emit(
        state.copyWith(
          status: AppStatus.mustUpdate,
          forceUpgrade: forceUpgrade,
        ),
      );
    }
  }
  Future<void> _onAppLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    if (state.user == null) return;
    await _userRepository.signOut();
    emit(
      state.copyWith(status: AppStatus.unauthenticated),
    );
  }

  @override
  Future<void> close() {
    unawaited(_userSubscription.cancel());
    _forceUpgradeSubscription.cancel();
    _isDownForMaintenanceSubscription.cancel();
    return super.close();
  }
}
