part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppUserChanged extends AppEvent {
  @visibleForTesting
  const AppUserChanged({required this.user});

  final User? user;

  @override
  List<Object?> get props => [user];
}

class AppDownForMaintenanceStatusChanged extends AppEvent {
  @visibleForTesting
  const AppDownForMaintenanceStatusChanged({
    required this.isDownForMaintenance,
  });

  final bool isDownForMaintenance;

  @override
  List<Object> get props => [isDownForMaintenance];
}

class AppForceUpgradeStatusChanged extends AppEvent {
  @visibleForTesting
  const AppForceUpgradeStatusChanged(this.forceUpgrade);

  final ForceUpgrade forceUpgrade;

  @override
  List<Object> get props => [forceUpgrade];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();

  @override
  List<Object?> get props => [];
}
