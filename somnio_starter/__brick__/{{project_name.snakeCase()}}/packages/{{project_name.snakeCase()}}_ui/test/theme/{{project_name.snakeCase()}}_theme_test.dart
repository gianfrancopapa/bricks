import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{short_name.upperCase()}}Theme', () {
    group('themeData', () {
      group('color', () {
        test('primary is red', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.primaryColor,
            {{short_name.upperCase()}}Colors.red,
          );
        });

        test('secondary is {{short_name.upperCase()}}Colors.secondary', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.colorScheme.secondary,
            {{short_name.upperCase()}}Colors.secondary,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.dividerTheme.indent,
            {{short_name.upperCase()}}Spacing.lg,
          );
          expect(
            const {{short_name.upperCase()}}Theme().themeData.dividerTheme.endIndent,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });

        test('space is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.dividerTheme.space,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });
      });

      group('switchTheme', () {
        group('thumbColor', () {
          test('returns darkAqua when selected', () {
            expect(
              const {{short_name.upperCase()}}Theme()
                  .themeData
                  .switchTheme
                  .thumbColor
                  ?.resolve({MaterialState.selected}),
              equals({{short_name.upperCase()}}pColors.darkAqua),
            );
          });

          test('returns eerieBlack when not selected', () {
            expect(
              const {{short_name.upperCase()}}Theme().themeData.switchTheme.thumbColor?.resolve({}),
              equals({{short_name.upperCase()}}Colors.eerieBlack),
            );
          });
        });

        group('trackColor', () {
          test('returns primaryContainer when selected', () {
            expect(
              const {{short_name.upperCase()}}Theme()
                  .themeData
                  .switchTheme
                  .trackColor
                  ?.resolve({MaterialState.selected}),
              equals({{short_name.upperCase()}}Colors.primaryContainer),
            );
          });

          test('returns paleSky when not selected', () {
            expect(
              const {{short_name.upperCase()}}Theme().themeData.switchTheme.trackColor?.resolve({}),
              equals({{short_name.upperCase()}}Colors.paleSky),
            );
          });
        });
      });

      group('progressIndicatorTheme', () {
        test('color is AppColors.red', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.progressIndicatorTheme.color,
            equals({{short_name.upperCase()}}Colors.red),
          );
        });

        test('circularTrackColor is AppColors.borderOutline', () {
          expect(
            const {{short_name.upperCase()}}Theme()
                .themeData
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
        test('primary is red', () {
          expect(
            const {{short_name.upperCase()}}DarkTheme().themeData.primaryColor,
            {{short_name.upperCase()}}Colors.red,
          );
        });

        test('secondary is {{short_name.upperCase()}}Colors.secondary', () {
          expect(
            const {{short_name.upperCase()}}DarkTheme().themeData.colorScheme.secondary,
            {{short_name.upperCase()}}Colors.secondary,
          );
        });

        test('background is grey.shade900', () {
          expect(
            const {{short_name.upperCase()}}DarkTheme().themeData.colorScheme.background,
            {{short_name.upperCase()}}Colors.grey.shade900,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.dividerTheme.indent,
            {{short_name.upperCase()}}Spacing.lg,
          );
          expect(
            const {{short_name.upperCase()}}Theme().themeData.dividerTheme.endIndent,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });

        test('space is {{short_name.upperCase()}}Spacing.lg', () {
          expect(
            const {{short_name.upperCase()}}Theme().themeData.dividerTheme.space,
            {{short_name.upperCase()}}Spacing.lg,
          );
        });
      });
    });
  });
}
