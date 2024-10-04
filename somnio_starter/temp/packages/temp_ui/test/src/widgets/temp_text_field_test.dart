import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  testWidgets('TEMPTextField displays default properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TEMPTextField(
            hintText: 'Default TextField',
          ),
        ),
      ),
    );

    expect(find.text('Default TextField'), findsOneWidget);

    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.enabled, isTrue);
  });

  testWidgets('TEMPTextField displays with initial value', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TEMPTextField(
            initialValue: 'Initial Value',
          ),
        ),
      ),
    );

    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.initialValue, 'Initial Value');
  });

  testWidgets('TEMPTextField displays error text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TEMPTextField(
            hintText: 'TextField with Error',
            errorText: 'Error Text',
          ),
        ),
      ),
    );

    expect(find.text('Error Text'), findsOneWidget);
  });
}
