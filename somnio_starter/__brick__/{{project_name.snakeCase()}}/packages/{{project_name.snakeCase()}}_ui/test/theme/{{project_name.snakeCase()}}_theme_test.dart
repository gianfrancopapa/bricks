import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{short_name.upperCase()}}LightTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is sky blue', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.colorScheme.primary,
            {{short_name.upperCase()}}Colors.skyBlue,
          );
        });

        test('secondary is {{short_name.upperCase()}}Colors.paleSky', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.colorScheme.secondary,
            {{short_name.upperCase()}}Colors.paleSky,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.dividerTheme.indent,
            {{short_name.upperCase()}}Spacing.lg,
          );
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.dividerTheme.endIndent,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });

        test('space is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.dividerTheme.space,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });
      });

      group('switchTheme', () {
        group('thumbColor', () {
          test('returns darkAqua when selected', () {
            expect(
              {{short_name.upperCase()}}Theme()
                  .lightTheme
                  .switchTheme
                  .thumbColor
                  ?.resolve({MaterialState.selected}),
              equals({{short_name.upperCase()}}Colors.darkAqua),
            );
          });

          test('returns black when not selected', () {
            expect(
              {{short_name.upperCase()}}Theme().lightTheme.switchTheme.thumbColor?.resolve({}),
              equals({{short_name.upperCase()}}Colors.black),
            );
          });
        });

        group('trackColor', () {
          test('returns primaryContainer when selected', () {
            expect(
              {{short_name.upperCase()}}Theme()
                  .lightTheme
                  .switchTheme
                  .trackColor
                  ?.resolve({MaterialState.selected}),
              equals({{short_name.upperCase()}}Colors.primaryContainer),
            );
          });

          test('returns paleSky when not selected', () {
            expect(
              {{short_name.upperCase()}}Theme().lightTheme.switchTheme.trackColor?.resolve({}),
              equals({{short_name.upperCase()}}Colors.paleSky),
            );
          });
        });
      });

      group('progressIndicatorTheme', () {
        test('color is {{short_name.upperCase()}}Colors.darkAqua', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.progressIndicatorTheme.color,
            equals({{short_name.upperCase()}}Colors.darkAqua),
          );
        });

        test('circularTrackColor is {{short_name.upperCase()}}Colors.borderOutline', () {
          expect(
            {{short_name.upperCase()}}Theme()
                .lightTheme
                .progressIndicatorTheme
                .circularTrackColor,
            equals({{short_name.upperCase()}}Colors.borderOutline),
          );
        });
      });
    });
  });

  group('{{short_name.upperCase()}}DarkTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is blue', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.colorScheme.primary,
            {{short_name.upperCase()}}Colors.blue,
          );
        });

        test('secondary is {{short_name.upperCase()}}Colors.paleSky', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.colorScheme.secondary,
            {{short_name.upperCase()}}Colors.paleSky,
          );
        });

        test('background is black', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.colorScheme.surface,
            {{short_name.upperCase()}}Colors.black,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.dividerTheme.indent,
            {{short_name.upperCase()}}Spacing.lg,
          );
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.dividerTheme.endIndent,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });

        test('space is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.dividerTheme.space,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });
      });
    });
  });
}
