import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram/authentication/delete_account/delete_account.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('DeleteAccountPage', () {
    test('is a page', () {
      expect(const DeleteAccountPage(), isA<Page<void>>());
    });
  });

  test('route is a [MaterialPageRoute]', () {
    final route = const DeleteAccountPage().createRoute(MockBuildContext());
    expect(route, isA<MaterialPageRoute<void>>());
  });

  testWidgets('route navigates to [DeleteAccountView]', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) {
          return SizedBox(
            child: ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () => Navigator.of(context).push<void>(
                const DeleteAccountPage().createRoute(context),
              ),
            ),
          );
        },
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(DeleteAccountView), findsOneWidget);
  });
}
