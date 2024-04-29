import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.initial()) {
    on<VersionNumberRetrieved>(_onVersionNumberRetrieved);
    on<AboutUsRetrieved>(_onAboutUsRetrieved);
  }

  Future<void> _onVersionNumberRetrieved(
    VersionNumberRetrieved event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final platformInfo = await PackageInfo.fromPlatform();

      emit(
        state.copyWith(
          appVersion: '${platformInfo.version}+${platformInfo.buildNumber}',
        ),
      );
    } on Exception {
      emit(state.copyWith(status: SettingsStatus.error));
    }
  }

  Future<void> _onTermsAndConditionsRetrieved(
    TermsAndConditionsRetrieved event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final termsAndConditionsUrl = Uri(
        scheme: 'https',
        host: 'pub.dev',
      );
      final canLaunch = await canLaunchUrl(termsAndConditionsUrl);
      if (canLaunch) {
        await launchUrl(termsAndConditionsUrl);
      }
    } catch (e) {
      emit(state.copyWith(status: SettingsStatus.error));
    }
  }

  Future<void> _onAboutUsRetrieved(
    AboutUsRetrieved event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      final aboutUsUrl = Uri(
        scheme: 'https',
        host: 'pub.dev',
      );
      final canLaunch = await canLaunchUrl(aboutUsUrl);
      if (canLaunch) {
        await launchUrl(aboutUsUrl);
      }
    } catch (e) {
      emit(state.copyWith(status: SettingsStatus.error));
    }
  }
  