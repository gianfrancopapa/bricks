import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

void main() {
  testWidgets('HomeView UI Test', (WidgetTester tester) async {
    // Build the HomeView widget
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );

    // Verify that the AppBar title is 'Home'
    expect(find.text('Home'), findsOneWidget);

    // Verify that the Placeholder widget is present in the body
    expect(find.byType(Placeholder), findsOneWidget);
  });
}
