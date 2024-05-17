import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/down_for_maintenance/down_for_maintenance_view.dart';
import 'package:{{project_name}}/l10n/l10n.dart';

void main() {
  group('DownForMaintenanceView', () {
    testWidgets('renders correct text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DownForMaintenanceView(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('showAsDialog displays dialog', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  DownForMaintenanceView.showAsDialog(context);
                },
                child: const Text('Show Dialog'),
              );
            },
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(Dialog), findsOneWidget);
    });
  });
}
