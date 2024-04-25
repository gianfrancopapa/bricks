import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';
import 'package:{{project_name}}/keys.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

void main() {
  late NavigatorObserver mockNavigatorObserver;
  late HomeBloc mockHomeBloc;

  setUpAll(() {
    registerFallbackValue(FakeRoute());
    mockHomeBloc = MockHomeBloc();
    when(() => mockHomeBloc.state).thenReturn(const HomeState.initial());
  });

  setUp(() {
    mockNavigatorObserver = MockNavigatorObserver();
  });
  group('HomeView', () {
    testWidgets('rendes correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        const HomeView(),
        homeBloc: mockHomeBloc,
      );

      expect(find.byKey(Keys.homeDeleteAccountButton), findsOneWidget);
      expect(find.byType(Placeholder), findsOneWidget);
    });

    testWidgets('navigates to [DeleteAccountView] when delete button is tapped',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const HomeView(),
        navigatorObserver: mockNavigatorObserver,
        homeBloc: mockHomeBloc,
      );

      await tester.tap(find.byKey(Keys.homeDeleteAccountButton));
      await tester.pumpAndSettle();
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });

    testWidgets('navigates to bottombar [Logout]', (WidgetTester tester) async {
      await tester.pumpApp(
        const HomeView(),
        navigatorObserver: mockNavigatorObserver,
        homeBloc: mockHomeBloc,
      );

      await tester.tap(find.byKey(const Key('HomeLogoutButton')));
      await tester.pumpAndSettle();
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });

    testWidgets('dialog shows when button is pressed',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const HomeView(),
        homeBloc: mockHomeBloc,
      );
      final button = find.byKey(Keys.homeLogoutButton);
      expect(button, findsOneWidget);
      await tester.runAsync(() async {
        final response = await tester.press(button);
        await response.up();
      });
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
    });

    testWidgets('dialog dismisses when cancel button is pressed',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const HomeView(),
        homeBloc: mockHomeBloc,
      );
      final button = find.byKey(
        Keys.homeLogoutButton,
      );
      expect(button, findsOneWidget);
      await tester.runAsync(() async {
        final response = await tester.press(button);
        await response.up();
      });
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsOneWidget);
      final cancelButton = find.byKey(Keys.cancelButton);
      await tester.tap(cancelButton);
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}
