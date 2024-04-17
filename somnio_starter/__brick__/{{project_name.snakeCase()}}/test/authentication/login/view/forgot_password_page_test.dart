import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('ForgotPasswordPage', () {
    test('is a page', () {
      expect(ForgotPasswordPage(), isA<Page<void>>());
    });
  });

  test('route is a [MaterialPageRoute]', () {
    final route = ForgotPasswordPage().createRoute(MockBuildContext());
    expect(route, isA<MaterialPageRoute<void>>());
  });

  testWidgets('route navigates to [ForgotPasswordView]', (tester) async {
    await tester.pumpApp(
      Builder(
        builder: (context) {
          return SizedBox(
            child: ElevatedButton(
              child: const Text('Navigate'),
              onPressed: () => Navigator.of(context).push<void>(
                ForgotPasswordPage().createRoute(context),
              ),
            ),
          );
        },
      ),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    expect(find.byType(ForgotPasswordView), findsOneWidget);
  });
}
