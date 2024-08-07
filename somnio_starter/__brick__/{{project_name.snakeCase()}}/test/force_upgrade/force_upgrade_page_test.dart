import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/force_upgrade/force_upgrade.dart';

import '../helpers/helpers.dart';

void main() {
  group('ForceUpgradePage', () {
    test('is a page', () {
      expect(const ForceUpgradePage(), isA<Page<void>>());
    });
  });

  test('route is a [MaterialPageRoute]', () {
    final route = const ForceUpgradePage().createRoute(MockBuildContext());
    expect(route, isA<MaterialPageRoute<void>>());
  });

  testWidgets('route navigates to [ForceUpgradeView]', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) {
          return SizedBox(
            child: ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () => Navigator.of(context).push<void>(
                const ForceUpgradePage().createRoute(context),
              ),
            ),
          );
        },
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(ForceUpgradeView), findsOneWidget);
  });
}
