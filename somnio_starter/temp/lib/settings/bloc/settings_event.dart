part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class VersionNumberRetrieved extends SettingsEvent {
  const VersionNumberRetrieved();
}

class TermsAndConditionsRetrieved extends SettingsEvent {
  const TermsAndConditionsRetrieved();
}

class AboutUsRetrieved extends SettingsEvent {
  const AboutUsRetrieved();
}
