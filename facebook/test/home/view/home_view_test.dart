import 'package:facebook/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

      expect(find.text('Home'), findsOneWidget);
      expect(find.byType(Placeholder), findsOneWidget);
    });

    testWidgets('navigates to [DeleteAccountView] when delete button is tapped',
        (WidgetTester tester) async {
      await tester.pumpApp(
        const HomeView(),
        navigatorObserver: mockNavigatorObserver,
        homeBloc: mockHomeBloc,
      );

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      verify(() => mockNavigatorObserver.didPush(any(), any()));
    });
  });
}
