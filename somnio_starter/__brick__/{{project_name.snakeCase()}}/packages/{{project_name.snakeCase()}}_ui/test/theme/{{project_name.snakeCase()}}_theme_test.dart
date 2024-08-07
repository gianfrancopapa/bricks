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

      group('lightOutlinedButtonTheme', () {
        test('shape is StadiumBorder', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.outlinedButtonTheme.style?.shape?.resolve({}),
            const StadiumBorder(),
          );
        });

        test('background color is {{short_name.upperCase()}}Colors.white', () {
          expect(
            {{short_name.upperCase()}}Theme()
                .lightTheme
                .outlinedButtonTheme
                .style
                ?.backgroundColor!
                .resolve({}),
            equals({{short_name.upperCase()}}Colors.white),
          );
        });

        test('side is BorderSide', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.outlinedButtonTheme.style?.side!.resolve({}),
            equals(const BorderSide()),
          );
        });

        test(
            'padding is EdgeInsets.symmetric(horizontal: {{short_name.upperCase()}}Spacing.xlg, vertical: {{short_name.upperCase()}}Spacing.lg)',
            () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.outlinedButtonTheme.style?.padding!.resolve({}),
            equals(
              const EdgeInsets.symmetric(
                horizontal: {{short_name.upperCase()}}Spacing.xlg,
                vertical: {{short_name.upperCase()}}Spacing.lg,
              ),
            ),
          );
        });

        test('alignment is Alignment.center', () {
          expect(
            {{short_name.upperCase()}}Theme().lightTheme.outlinedButtonTheme.style?.alignment,
            equals(Alignment.center),
          );
        });

        test('text style for disabled state', () {
          final disabledTextStyle = {{short_name.upperCase()}}Theme()
              .lightTheme
              .outlinedButtonTheme
              .style
              ?.textStyle!
              .resolve({WidgetState.disabled});
          expect(
            disabledTextStyle?.color,
            equals({{short_name.upperCase()}}Colors.black),
          );
          expect(
            disabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });

        test('text style for enabled state', () {
          final enabledTextStyle = {{short_name.upperCase()}}Theme()
              .lightTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({});
          expect(
            enabledTextStyle?.color,
            equals({{short_name.upperCase()}}Colors.white),
          );
          expect(
            enabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
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

      group('darkOutlinedButtonTheme', () {
        test('shape is StadiumBorder', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.outlinedButtonTheme.style?.shape?.resolve({}),
            const StadiumBorder(),
          );
        });

        test('background color is {{short_name.upperCase()}}Colors.black', () {
          expect(
            {{short_name.upperCase()}}Theme()
                .darkTheme
                .outlinedButtonTheme
                .style
                ?.backgroundColor
                ?.resolve({}),
            equals({{short_name.upperCase()}}Colors.black),
          );
        });

        test('side color is {{short_name.upperCase()}}Colors.white', () {
          expect(
            {{short_name.upperCase()}}Theme()
                .darkTheme
                .outlinedButtonTheme
                .style
                ?.side
                ?.resolve({})?.color,
            equals({{short_name.upperCase()}}Colors.white),
          );
        });

        test(
            'padding is EdgeInsets.symmetric(horizontal: {{short_name.upperCase()}}Spacing.xlg, vertical: {{short_name.upperCase()}}Spacing.lg)',
            () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.outlinedButtonTheme.style?.padding?.resolve({}),
            equals(
              const EdgeInsets.symmetric(
                horizontal: {{short_name.upperCase()}}Spacing.xlg,
                vertical: {{short_name.upperCase()}}Spacing.lg,
              ),
            ),
          );
        });

        test('alignment is Alignment.center', () {
          expect(
            {{short_name.upperCase()}}Theme().darkTheme.outlinedButtonTheme.style?.alignment,
            equals(Alignment.center),
          );
        });

        test('text style for disabled state', () {
          final disabledTextStyle = {{short_name.upperCase()}}Theme()
              .darkTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({WidgetState.disabled});
          expect(
            disabledTextStyle?.color,
            equals({{short_name.upperCase()}}Colors.white),
          );
          expect(
            disabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });

        test('text style for enabled state', () {
          final enabledTextStyle = {{short_name.upperCase()}}Theme()
              .darkTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({});
          expect(
            enabledTextStyle?.color,
            equals({{short_name.upperCase()}}Colors.white),
          );
          expect(
            enabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });
      });
    });
  });
}
