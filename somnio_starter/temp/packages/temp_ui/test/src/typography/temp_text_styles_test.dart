import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  group('TextStyles', () {
    group('UITextStyle', () {
      test('display2 returns TextStyle', () {
        expect(UITextStyle.display2, isA<TextStyle>());
      });

      test('display3 returns TextStyle', () {
        expect(UITextStyle.display3, isA<TextStyle>());
      });

      test('headline1 returns TextStyle', () {
        expect(UITextStyle.headline1, isA<TextStyle>());
      });

      test('headline2 returns TextStyle', () {
        expect(UITextStyle.headline2, isA<TextStyle>());
      });

      test('headline3 returns TextStyle', () {
        expect(UITextStyle.headline3, isA<TextStyle>());
      });

      test('subtitle1 returns TextStyle', () {
        expect(UITextStyle.subtitle1, isA<TextStyle>());
      });

      test('subtitle2 returns TextStyle', () {
        expect(UITextStyle.subtitle2, isA<TextStyle>());
      });

      test('bodyText1 returns TextStyle', () {
        expect(UITextStyle.bodyText1, isA<TextStyle>());
      });

      test('bodyText2 returns TextStyle', () {
        expect(UITextStyle.bodyText2, isA<TextStyle>());
      });

      test('button returns TextStyle', () {
        expect(UITextStyle.button, isA<TextStyle>());
      });

      test('caption returns TextStyle', () {
        expect(UITextStyle.caption, isA<TextStyle>());
      });

      test('overline returns TextStyle', () {
        expect(UITextStyle.overline, isA<TextStyle>());
      });

      test('labelSmall returns TextStyle', () {
        expect(UITextStyle.labelSmall, isA<TextStyle>());
      });
    });
  });
}
