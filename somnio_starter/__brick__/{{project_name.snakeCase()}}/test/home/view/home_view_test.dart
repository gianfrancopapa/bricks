import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

void main() {
  testWidgets('HomeView', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeView(),
      ),
    );

    expect(find.text('Home'), findsOneWidget);

    expect(find.byType(Placeholder), findsOneWidget);
  });
}
