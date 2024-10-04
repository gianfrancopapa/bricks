import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';
void main() {
  testWidgets('TEMPAppBar displays with actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: TEMPAppBar.actionAppBar(
            textTitle: 'Action AppBar',
          ),
        ),
      ),
    );

    expect(find.text('Action AppBar'), findsOneWidget);

    expect(find.text('Action 1'), findsOneWidget);

    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.elevation, 3);
  });

  testWidgets('TEMPAppBar displays with red background color', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: TEMPAppBar.redAppBar(
            textTitle: 'Red AppBar',
          ),
        ),
      ),
    );

    expect(find.text('Red AppBar'), findsOneWidget);

    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, TEMPColors.red);

    expect(appBar.elevation, 5);
  });
}
