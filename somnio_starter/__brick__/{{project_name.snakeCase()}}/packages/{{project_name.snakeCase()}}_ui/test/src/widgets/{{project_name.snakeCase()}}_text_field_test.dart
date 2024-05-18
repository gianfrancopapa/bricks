import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';

void main() {
  testWidgets('{{short_name.upperCase()}}TextField displays default properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}TextField(
            hintText: 'Default TextField',
          ),
        ),
      ),
    );

    expect(find.text('Default TextField'), findsOneWidget);

    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.enabled, isTrue);
  });

  testWidgets('{{short_name.upperCase()}}TextField displays with initial value', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}TextField(
            initialValue: 'Initial Value',
          ),
        ),
      ),
    );

    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.initialValue, 'Initial Value');
  });

  testWidgets('{{short_name.upperCase()}}TextField displays error text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}TextField(
            hintText: 'TextField with Error',
            errorText: 'Error Text',
          ),
        ),
      ),
    );

    expect(find.text('Error Text'), findsOneWidget);
  });
}
