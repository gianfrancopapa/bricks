import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
void main() {
  testWidgets('{{short_name.upperCase()}}AppBar displays with actions', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: {{short_name.upperCase()}}AppBar.actionAppBar(
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

  testWidgets('{{short_name.upperCase()}}AppBar displays with red background color', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: {{short_name.upperCase()}}AppBar.redAppBar(
            textTitle: 'Red AppBar',
          ),
        ),
      ),
    );

    expect(find.text('Red AppBar'), findsOneWidget);

    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, {{short_name.upperCase()}}Colors.red);

    expect(appBar.elevation, 5);
  });
}
