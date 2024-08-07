import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';

void main() {
  testWidgets('{{short_name.upperCase()}}OutlinedButton displays default properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}OutlinedButton(
            text: 'Default Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Default Button'), findsOneWidget);

    final outlinedButton =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(outlinedButton.onPressed, isNotNull);
  });

  testWidgets('{{short_name.upperCase()}}OutlinedButton primary displays correct properties',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}OutlinedButton.primary(
            text: 'Primary Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Primary Button'), findsOneWidget);

    final outlinedButton =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(outlinedButton.onPressed, isNotNull);

    final container =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(container.style?.backgroundColor?.resolve({}), {{short_name.upperCase()}}Colors.lightBlue200);

    final textWidget = tester.widget<Text>(find.text('Primary Button'));
    expect(textWidget.style?.color, {{short_name.upperCase()}}Colors.black);
  });

  testWidgets('{{short_name.upperCase()}}OutlinedButton secondary displays correct properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}OutlinedButton.secondary(
            text: 'Secondary Button',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Secondary Button'), findsOneWidget);

    final outlinedButton =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(outlinedButton.onPressed, isNotNull);

    final container =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(container.style?.backgroundColor?.resolve({}), {{short_name.upperCase()}}Colors.grey);

    final textWidget = tester.widget<Text>(find.text('Secondary Button'));
    expect(textWidget.style?.color, {{short_name.upperCase()}}Colors.white);
  });

  testWidgets('{{short_name.upperCase()}}OutlinedButton displays with icon', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}OutlinedButton(
            text: 'Button with Icon',
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Button with Icon'), findsOneWidget);

    expect(find.byIcon(Icons.add), findsOneWidget);
  });

  testWidgets('{{short_name.upperCase()}}OutlinedButton displays as disabled when onPressed is null', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: {{short_name.upperCase()}}OutlinedButton(
            text: 'Disabled Button',
          ),
        ),
      ),
    );

    expect(find.text('Disabled Button'), findsOneWidget);

    final outlinedButton =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(outlinedButton.onPressed, isNull);

    final theme = Theme.of(tester.element(find.byType({{short_name.upperCase()}}OutlinedButton)));
    final textWidget = tester.widget<Text>(find.text('Disabled Button'));
    expect(textWidget.style?.color, theme.colorScheme.onSurface);
  });
}