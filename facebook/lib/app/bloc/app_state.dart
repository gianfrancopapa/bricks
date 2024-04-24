part of 'app_bloc.dart';

enum AppStatus {
  downForMaintenance,
  authenticated,
  unauthenticated,
  mustUpdate;
}

class AppState extends Equatable {
  const AppState({
    required this.user,
    required this.status,
     this.forceUpgrade = const ForceUpgrade(isUpgradeRequired: false),
     this.isDownForMaintenance = false,
  });

  const AppState.authenticated({
    required User user,
    required ForceUpgrade? forceUpgrade,
    required bool? isDownForMaintenance,
  }) : this(
          user: user,
          status: AppStatus.authenticated,
          forceUpgrade: forceUpgrade,
          isDownForMaintenance: isDownForMaintenance,
        );

  const AppState.unauthenticated({
    required ForceUpgrade? forceUpgrade,
    required bool? isDownForMaintenance,
  }) : this(
          user: null,
          status: AppStatus.unauthenticated,
          forceUpgrade: forceUpgrade,
          isDownForMaintenance: isDownForMaintenance,
        );

  const AppState.downForMaintenance({
    required ForceUpgrade? forceUpgrade,
    required bool isDownForMaintenance,
    User? user,
  }) : this(
          user: user,
          status: AppStatus.downForMaintenance,
          forceUpgrade: forceUpgrade,
          isDownForMaintenance: isDownForMaintenance,
        );

  final User? user;
  final AppStatus status;
  final ForceUpgrade? forceUpgrade;
  final bool? isDownForMaintenance;

  @override
  List<Object?> get props => [
        user,
        status,
      ];

  AppState copyWith({
    User? user,
    AppStatus? status,
    ForceUpgrade? forceUpgrade,
    bool? isDownForMaintenance,
  }) {
    return AppState(
      user: user ?? this.user,
      status: status ?? this.status,
      forceUpgrade: forceUpgrade ?? this.forceUpgrade,
      isDownForMaintenance: isDownForMaintenance ?? this.isDownForMaintenance,
    );
  }
}
