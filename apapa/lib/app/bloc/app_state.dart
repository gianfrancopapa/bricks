part of 'app_bloc.dart';

enum AppStatus {
  downForMaintenance,
  authenticated,
  unauthenticated;
}

class AppState extends Equatable {
  const AppState({
    required this.user,
    required this.status,
  });

  const AppState.authenticated({
    required User user,
  }) : this(
          user: user,
          status: AppStatus.authenticated,
        );

  const AppState.unauthenticated()
      : this(
          user: null,
          status: AppStatus.unauthenticated,
        );

  const AppState.downForMaintenance({
    User? user,
  }) : this(
          user: user,
          status: AppStatus.downForMaintenance,
        );

  final User? user;
  final AppStatus status;

  @override
  List<Object?> get props => [
        user,
        status,
      ];

  AppState copyWith({
    User? user,
    AppStatus? status,
  }) {
    return AppState(
      user: user,
      status: status ?? this.status,
    );
  }
}
