import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/settings/bloc/settings_bloc.dart';

void main() {
  test('supports value comparison', () {
    expect(
      const SettingsState.initial().props,
      equals([const SettingsState.initial().status, '']),
    );
    expect(
      const SettingsState.initial(),
      const SettingsState.initial(),
    );
  });

  test('returns a copy with updated status', () {
    expect(
      const SettingsState.initial().copyWith(
        status: SettingsStatus.loading,
        appVersion: '1.0.0+1',
      ),
      const SettingsState(
        status: SettingsStatus.loading,
        appVersion: '1.0.0+1',
      ),
    );
    expect(
      const SettingsState.initial().copyWith(),
      const SettingsState.initial(),
    );
  });
}
