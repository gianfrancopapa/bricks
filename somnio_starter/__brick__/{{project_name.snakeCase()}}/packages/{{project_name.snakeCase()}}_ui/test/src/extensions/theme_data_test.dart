import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ThemeX Extension Tests', () {
    test('Test light mode icons', () {
      final lightTheme = ThemeData(brightness: Brightness.light);
      expect(lightTheme.icons, isA<{{short_name.upperCase()}}IconsLight>());
    });

    test('Test dark mode icons', () {
      final darkTheme = ThemeData(brightness: Brightness.dark);
      expect(darkTheme.icons, isA<{{short_name.upperCase()}}IconsDark>());
    });
  });
}
