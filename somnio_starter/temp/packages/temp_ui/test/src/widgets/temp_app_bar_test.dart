import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';
void main() {
  testWidgets('UIAppBar displays with actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: UIAppBar.actionAppBar(
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

  testWidgets('UIAppBar displays with red background color', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: UIAppBar.redAppBar(
            textTitle: 'Red AppBar',
          ),
        ),
      ),
    );

    expect(find.text('Red AppBar'), findsOneWidget);

    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, UIColors.red);

    expect(appBar.elevation, 5);
  });
}
