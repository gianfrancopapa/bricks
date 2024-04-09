part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppDownForMaintenanceStatusChanged extends AppEvent {
  @visibleForTesting
  const AppDownForMaintenanceStatusChanged({this.isDownForMaintenance = false});

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
