import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  testWidgets('UITextField displays default properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UITextField(
            hintText: 'Default TextField',
          ),
        ),
      ),
    );

    expect(find.text('Default TextField'), findsOneWidget);

    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.enabled, isTrue);
  });

  testWidgets('UITextField displays with initial value', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UITextField(
            initialValue: 'Initial Value',
          ),
        ),
      ),
    );

    final textField = tester.widget<TextFormField>(find.byType(TextFormField));
    expect(textField.initialValue, 'Initial Value');
  });

  testWidgets('UITextField displays error text', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UITextField(
            hintText: 'TextField with Error',
            errorText: 'Error Text',
          ),
        ),
      ),
    );

    expect(find.text('Error Text'), findsOneWidget);
  });
}
