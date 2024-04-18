import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

import '../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    test('is a page', () {
      expect(const HomePage(), isA<Page<void>>());
    });
  });

  test('route is a [MaterialPageRoute]', () {
    final route = const HomePage().createRoute(MockBuildContext());
    expect(route, isA<MaterialPageRoute<void>>());
  });

  testWidgets('route navigates to [HomeView]', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) {
          return SizedBox(
            child: ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () => Navigator.of(context).push<void>(
                const HomePage().createRoute(context),
              ),
            ),
          );
        },
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomeView), findsOneWidget);
  });
}
