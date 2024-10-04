import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  testWidgets('TEMPOutlinedButton displays default properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TEMPOutlinedButton(
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

  testWidgets('TEMPOutlinedButton primary displays correct properties',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TEMPOutlinedButton.primary(
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
    expect(container.style?.backgroundColor?.resolve({}), TEMPColors.lightBlue200);

    final textWidget = tester.widget<Text>(find.text('Primary Button'));
    expect(textWidget.style?.color, TEMPColors.black);
  });

  testWidgets('TEMPOutlinedButton secondary displays correct properties', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TEMPOutlinedButton.secondary(
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
    expect(container.style?.backgroundColor?.resolve({}), TEMPColors.grey);

    final textWidget = tester.widget<Text>(find.text('Secondary Button'));
    expect(textWidget.style?.color, TEMPColors.white);
  });

  testWidgets('TEMPOutlinedButton displays with icon', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TEMPOutlinedButton(
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

  testWidgets('TEMPOutlinedButton displays as disabled when onPressed is null', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TEMPOutlinedButton(
            text: 'Disabled Button',
          ),
        ),
      ),
    );

    expect(find.text('Disabled Button'), findsOneWidget);

    final outlinedButton =
        tester.widget<OutlinedButton>(find.byType(OutlinedButton));
    expect(outlinedButton.onPressed, isNull);

    final theme = Theme.of(tester.element(find.byType(TEMPOutlinedButton)));
    final textWidget = tester.widget<Text>(find.text('Disabled Button'));
    expect(textWidget.style?.color, theme.colorScheme.onSurface);
  });
}