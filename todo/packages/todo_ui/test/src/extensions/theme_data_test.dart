import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_ui/todo_ui.dart';

void main() {
  group('ThemeX Extension Tests', () {
    test('Test light mode icons', () {
      final lightTheme = ThemeData(brightness: Brightness.light);
      expect(lightTheme.icons, isA<UIIconsLight>());
    });

    test('Test dark mode icons', () {
      final darkTheme = ThemeData(brightness: Brightness.dark);
      expect(darkTheme.icons, isA<UIIconsDark>());
    });
  });
}
