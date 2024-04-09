part of 'app_bloc.dart';

enum AppStatus {
  downForMaintenance,
  forceUpgradeRequired,
  returnedUser,
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.forceUpgrade = const ForceUpgrade(isUpgradeRequired: false),
  });

  const AppState.downForMaintenance()
      : this._(
          status: AppStatus.downForMaintenance,
        );

  const AppState.forceUpgradeRequired(
    ForceUpgrade forceUpgrade,
  ) : this._(
          status: AppStatus.forceUpgradeRequired,
          forceUpgrade: forceUpgrade,
        );

  final AppStatus status;
  final ForceUpgrade forceUpgrade;

  @override
  List<Object?> get props => [status, forceUpgrade];
}
