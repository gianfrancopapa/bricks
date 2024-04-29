part of 'settings_bloc.dart';

enum SettingsStatus {
  initial,
  loading,
  loaded,
  error,
}

class SettingsState extends Equatable {
  const SettingsState({
    required this.status,
    required this.appVersion,
  });

  const SettingsState.initial()
      : this(
          status: SettingsStatus.initial,
          appVersion: '',
        );

  final SettingsStatus status;
  final String appVersion;

  SettingsState copyWith({
    SettingsStatus? status,
    String? appVersion,
  }) {
    return SettingsState(
      status: status ?? this.status,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  @override
  List<Object> get props => [
        status,
        appVersion,
      ];
}
