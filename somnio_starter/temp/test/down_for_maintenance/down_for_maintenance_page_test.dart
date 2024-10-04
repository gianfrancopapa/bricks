import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp/down_for_maintenance/down_for_maintenance.dart';

import '../helpers/helpers.dart';

void main() {
  group('DownForMaintenancePage', () {
    test('is a page', () {
      expect(const DownForMaintenancePage(), isA<Page<void>>());
    });
  });

  test('route is a [MaterialPageRoute]', () {
    final route =
        const DownForMaintenancePage().createRoute(MockBuildContext());
    expect(route, isA<MaterialPageRoute<void>>());
  });

  testWidgets('route navigates to [DownForMaintenanceView]', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) {
          return SizedBox(
            child: ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () => Navigator.of(context).push<void>(
                const DownForMaintenancePage().createRoute(context),
              ),
            ),
          );
        },
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(DownForMaintenanceView), findsOneWidget);
  });
}
