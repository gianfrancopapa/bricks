import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp/authentication/sign_up/view/view.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('SignUpPage', () {
    test('is a page', () {
      expect(const SignUpPage(), isA<Page<void>>());
    });
  });

  test('route is a [MaterialPageRoute]', () {
    final route = const SignUpPage().createRoute(MockBuildContext());
    expect(route, isA<MaterialPageRoute<void>>());
  });

  testWidgets('route navigates to [SignUpView]', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) {
          return SizedBox(
            child: ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () => Navigator.of(context).push<void>(
                const SignUpPage().createRoute(context),
              ),
            ),
          );
        },
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpView), findsOneWidget);
  });
}
