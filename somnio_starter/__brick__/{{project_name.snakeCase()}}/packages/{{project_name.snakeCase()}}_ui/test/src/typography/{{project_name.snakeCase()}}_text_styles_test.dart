import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextStyles', () {
    group('{{short_name.upperCase()}}TextStyle', () {
      test('display2 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.display2, isA<TextStyle>());
      });

      test('display3 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.display3, isA<TextStyle>());
      });

      test('headline1 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.headline1, isA<TextStyle>());
      });

      test('headline2 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.headline2, isA<TextStyle>());
      });

      test('headline3 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.headline3, isA<TextStyle>());
      });

      test('subtitle1 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.subtitle1, isA<TextStyle>());
      });

      test('subtitle2 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.subtitle2, isA<TextStyle>());
      });

      test('bodyText1 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.bodyText1, isA<TextStyle>());
      });

      test('bodyText2 returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.bodyText2, isA<TextStyle>());
      });

      test('button returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.button, isA<TextStyle>());
      });

      test('caption returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.caption, isA<TextStyle>());
      });

      test('overline returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.overline, isA<TextStyle>());
      });

      test('labelSmall returns TextStyle', () {
        expect({{short_name.upperCase()}}TextStyle.labelSmall, isA<TextStyle>());
      });
    });
  });
}
