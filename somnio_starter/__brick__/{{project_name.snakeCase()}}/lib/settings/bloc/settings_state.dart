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
  });

  const SettingsState.initial()
      : this(        
          status: SettingsStatus.initial,
        );

  final SettingsStatus status;

  SettingsState copyWith({
    SettingsStatus? status,
  }) {
    return SettingsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
