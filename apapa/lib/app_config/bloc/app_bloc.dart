import 'dart:async';

import 'package:app_config_repository/app_config_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AppConfigRepository appConfigRepository,
  }) : super(const AppState._(status: AppStatus.authenticated)) {
    on<AppDownForMaintenanceStatusChanged>(
      _handleDownForMaintenanceStatusChanged,
    );
    on<AppForceUpgradeStatusChanged>(_handleForceUpgradeStatusChanged);
    _forceUpgradeSubscription = appConfigRepository
        .isForceUpgradeRequired()
        .listen(_forceUpgradeStatusChanged);
    _isDownForMaintenanceSubscription = appConfigRepository
        .isDownForMaintenance()
        .listen(_downForMaintenanceStatusChanged);
  }

  late StreamSubscription<ForceUpgrade> _forceUpgradeSubscription;
  late StreamSubscription<bool> _isDownForMaintenanceSubscription;

  void _downForMaintenanceStatusChanged(bool isDownForMaintenance) {
    add(AppDownForMaintenanceStatusChanged(
      isDownForMaintenance: isDownForMaintenance,
    ),);
  }

  void _forceUpgradeStatusChanged(ForceUpgrade forceUpgrade) {
    add(AppForceUpgradeStatusChanged(forceUpgrade));
  }

  void _handleDownForMaintenanceStatusChanged(
    AppDownForMaintenanceStatusChanged event,
    Emitter<AppState> emit,
  ) {
    if (event.isDownForMaintenance) {
      return emit(const AppState.downForMaintenance());
    }

    if (state.status != AppStatus.downForMaintenance) return;
  }

  void _handleForceUpgradeStatusChanged(
    AppForceUpgradeStatusChanged event,
    Emitter<AppState> emit,
  ) {
    if (event.forceUpgrade.isUpgradeRequired) {
      return emit(
        AppState.forceUpgradeRequired(
          event.forceUpgrade,
        ),
      );
    }
    if (state.status != AppStatus.forceUpgradeRequired) {
      return;
    }
  }

  @override
  Future<void> close() {
    _forceUpgradeSubscription.cancel();
    _isDownForMaintenanceSubscription.cancel();
    return super.close();
  }
}
