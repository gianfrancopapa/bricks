import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/settings/settings.dart';

void main() {
  late SettingsBloc settingsBloc;

  setUp(() {
    settingsBloc = SettingsBloc();
  });

  tearDown(() {
    settingsBloc.close();
  });

  group('TermsAndConditionsRetrieved event', () {
    blocTest<SettingsBloc, SettingsState>(
      'emits error state when canLaunchUrl returns false',
      build: SettingsBloc.new,
      act: (bloc) => bloc.add(const TermsAndConditionsRetrieved()),
      expect: () => [
        const SettingsState.initial().copyWith(status: SettingsStatus.error),
      ],
    );
  });
}
