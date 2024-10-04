import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  group('TextStyles', () {
    group('TEMPTextStyle', () {
      test('display2 returns TextStyle', () {
        expect(TEMPTextStyle.display2, isA<TextStyle>());
      });

      test('display3 returns TextStyle', () {
        expect(TEMPTextStyle.display3, isA<TextStyle>());
      });

      test('headline1 returns TextStyle', () {
        expect(TEMPTextStyle.headline1, isA<TextStyle>());
      });

      test('headline2 returns TextStyle', () {
        expect(TEMPTextStyle.headline2, isA<TextStyle>());
      });

      test('headline3 returns TextStyle', () {
        expect(TEMPTextStyle.headline3, isA<TextStyle>());
      });

      test('subtitle1 returns TextStyle', () {
        expect(TEMPTextStyle.subtitle1, isA<TextStyle>());
      });

      test('subtitle2 returns TextStyle', () {
        expect(TEMPTextStyle.subtitle2, isA<TextStyle>());
      });

      test('bodyText1 returns TextStyle', () {
        expect(TEMPTextStyle.bodyText1, isA<TextStyle>());
      });

      test('bodyText2 returns TextStyle', () {
        expect(TEMPTextStyle.bodyText2, isA<TextStyle>());
      });

      test('button returns TextStyle', () {
        expect(TEMPTextStyle.button, isA<TextStyle>());
      });

      test('caption returns TextStyle', () {
        expect(TEMPTextStyle.caption, isA<TextStyle>());
      });

      test('overline returns TextStyle', () {
        expect(TEMPTextStyle.overline, isA<TextStyle>());
      });

      test('labelSmall returns TextStyle', () {
        expect(TEMPTextStyle.labelSmall, isA<TextStyle>());
      });
    });
  });
}
