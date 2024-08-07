import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/settings/settings.dart';

import '../../helpers/helpers.dart';

void main() {
  late NavigatorObserver mockNavigatorObserver;
  late SettingsBloc mockSettingsBloc;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
    mockSettingsBloc = MockSettingsBloc();
    when(() => mockSettingsBloc.state)
        .thenReturn(const SettingsState.initial());
  });

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });

  group('SettingsView', () {
    testWidgets('renders SettingsView', (tester) async {
      await tester.pumpApp(
        const SettingsView(),
        settingsBloc: mockSettingsBloc,
      );

      expect(
        find.byKey(
          const Key('SettingsAppBar'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders ContactUsSettingsItem', (tester) async {
      await tester.pumpApp(
        const SettingsView(),
        settingsBloc: mockSettingsBloc,
      );

      expect(
        find.byKey(
          const Key('ContactUsSettingsItem'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders TermsAndConditionsSettingsItem', (tester) async {
      await tester.pumpApp(
        const SettingsView(),
        settingsBloc: mockSettingsBloc,
      );

      expect(
        find.byKey(
          const Key('TermsAndConditionsSettingsItem'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders AboutUsSettingsItem', (tester) async {
      await tester.pumpApp(
        const SettingsView(),
        settingsBloc: mockSettingsBloc,
      );

      expect(
        find.byKey(
          const Key('AboutUsSettingsItem'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('renders AppVersionSettingsItem', (tester) async {
      await tester.pumpApp(
        const SettingsView(),
        settingsBloc: mockSettingsBloc,
      );

      expect(
        find.byKey(
          const Key('AppVersionSettingsItem'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('navigates to DeleteAccountPage when delete account is tapped',
        (tester) async {
      await tester.pumpApp(
        const SettingsView(),
        navigatorObserver: mockNavigatorObserver,
        settingsBloc: mockSettingsBloc,
      );

      await tester.tap(find.byKey(const Key('DeleteAccountSettingsItem')));
      await tester.pumpAndSettle();
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });
  });
}
