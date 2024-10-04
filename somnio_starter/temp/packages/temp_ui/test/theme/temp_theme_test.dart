import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  group('TEMPLightTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is sky blue', () {
          expect(
            TEMPTheme().lightTheme.colorScheme.primary,
            TEMPColors.skyBlue,
          );
        });

        test('secondary is TEMPColors.paleSky', () {
          expect(
            TEMPTheme().lightTheme.colorScheme.secondary,
            TEMPColors.paleSky,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is TEMPSpacing.lg', () {
          expect(
            TEMPTheme().lightTheme.dividerTheme.indent,
            TEMPSpacing.lg,
          );
          expect(
            TEMPTheme().lightTheme.dividerTheme.endIndent,
            TEMPSpacing.lg,
          );
        });

        test('space is TEMPSpacing.lg', () {
          expect(
            TEMPTheme().lightTheme.dividerTheme.space,
            TEMPSpacing.lg,
          );
        });
      });

      group('switchTheme', () {
        group('thumbColor', () {
          test('returns darkAqua when selected', () {
            expect(
              TEMPTheme()
                  .lightTheme
                  .switchTheme
                  .thumbColor
                  ?.resolve({WidgetState.selected}),
              equals(TEMPColors.darkAqua),
            );
          });

          test('returns black when not selected', () {
            expect(
              TEMPTheme().lightTheme.switchTheme.thumbColor?.resolve({}),
              equals(TEMPColors.black),
            );
          });
        });

        group('trackColor', () {
          test('returns primaryContainer when selected', () {
            expect(
              TEMPTheme()
                  .lightTheme
                  .switchTheme
                  .trackColor
                  ?.resolve({WidgetState.selected}),
              equals(TEMPColors.primaryContainer),
            );
          });

          test('returns paleSky when not selected', () {
            expect(
              TEMPTheme().lightTheme.switchTheme.trackColor?.resolve({}),
              equals(TEMPColors.paleSky),
            );
          });
        });
      });

      group('progressIndicatorTheme', () {
        test('color is TEMPColors.darkAqua', () {
          expect(
            TEMPTheme().lightTheme.progressIndicatorTheme.color,
            equals(TEMPColors.darkAqua),
          );
        });

        test('circularTrackColor is TEMPColors.borderOutline', () {
          expect(
            TEMPTheme()
                .lightTheme
                .progressIndicatorTheme
                .circularTrackColor,
            equals(TEMPColors.borderOutline),
          );
        });
      });

      group('lightOutlinedButtonTheme', () {
        test('shape is StadiumBorder', () {
          expect(
            TEMPTheme().lightTheme.outlinedButtonTheme.style?.shape?.resolve({}),
            const StadiumBorder(),
          );
        });

        test('background color is TEMPColors.white', () {
          expect(
            TEMPTheme()
                .lightTheme
                .outlinedButtonTheme
                .style
                ?.backgroundColor!
                .resolve({}),
            equals(TEMPColors.white),
          );
        });

        test('side is BorderSide', () {
          expect(
            TEMPTheme().lightTheme.outlinedButtonTheme.style?.side!.resolve({}),
            equals(const BorderSide()),
          );
        });

        test(
            'padding is EdgeInsets.symmetric(horizontal: TEMPSpacing.xlg, vertical: TEMPSpacing.lg)',
            () {
          expect(
            TEMPTheme().lightTheme.outlinedButtonTheme.style?.padding!.resolve({}),
            equals(
              const EdgeInsets.symmetric(
                horizontal: TEMPSpacing.xlg,
                vertical: TEMPSpacing.lg,
              ),
            ),
          );
        });

        test('alignment is Alignment.center', () {
          expect(
            TEMPTheme().lightTheme.outlinedButtonTheme.style?.alignment,
            equals(Alignment.center),
          );
        });

        test('text style for disabled state', () {
          final disabledTextStyle = TEMPTheme()
              .lightTheme
              .outlinedButtonTheme
              .style
              ?.textStyle!
              .resolve({WidgetState.disabled});
          expect(
            disabledTextStyle?.color,
            equals(TEMPColors.black),
          );
          expect(
            disabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });

        test('text style for enabled state', () {
          final enabledTextStyle = TEMPTheme()
              .lightTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({});
          expect(
            enabledTextStyle?.color,
            equals(TEMPColors.white),
          );
          expect(
            enabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });
      });
    });
  });

  group('TEMPDarkTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is blue', () {
          expect(
            TEMPTheme().darkTheme.colorScheme.primary,
            TEMPColors.blue,
          );
        });

        test('secondary is TEMPColors.paleSky', () {
          expect(
            TEMPTheme().darkTheme.colorScheme.secondary,
            TEMPColors.paleSky,
          );
        });

        test('background is black', () {
          expect(
            TEMPTheme().darkTheme.colorScheme.surface,
            TEMPColors.black,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is TEMPSpacing.lg', () {
          expect(
            TEMPTheme().darkTheme.dividerTheme.indent,
            TEMPSpacing.lg,
          );
          expect(
            TEMPTheme().darkTheme.dividerTheme.endIndent,
            TEMPSpacing.lg,
          );
        });

        test('space is TEMPSpacing.lg', () {
          expect(
            TEMPTheme().darkTheme.dividerTheme.space,
            TEMPSpacing.lg,
          );
        });
      });

      group('darkOutlinedButtonTheme', () {
        test('shape is StadiumBorder', () {
          expect(
            TEMPTheme().darkTheme.outlinedButtonTheme.style?.shape?.resolve({}),
            const StadiumBorder(),
          );
        });

        test('background color is TEMPColors.black', () {
          expect(
            TEMPTheme()
                .darkTheme
                .outlinedButtonTheme
                .style
                ?.backgroundColor
                ?.resolve({}),
            equals(TEMPColors.black),
          );
        });

        test('side color is TEMPColors.white', () {
          expect(
            TEMPTheme()
                .darkTheme
                .outlinedButtonTheme
                .style
                ?.side
                ?.resolve({})?.color,
            equals(TEMPColors.white),
          );
        });

        test(
            'padding is EdgeInsets.symmetric(horizontal: TEMPSpacing.xlg, vertical: TEMPSpacing.lg)',
            () {
          expect(
            TEMPTheme().darkTheme.outlinedButtonTheme.style?.padding?.resolve({}),
            equals(
              const EdgeInsets.symmetric(
                horizontal: TEMPSpacing.xlg,
                vertical: TEMPSpacing.lg,
              ),
            ),
          );
        });

        test('alignment is Alignment.center', () {
          expect(
            TEMPTheme().darkTheme.outlinedButtonTheme.style?.alignment,
            equals(Alignment.center),
          );
        });

        test('text style for disabled state', () {
          final disabledTextStyle = TEMPTheme()
              .darkTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({WidgetState.disabled});
          expect(
            disabledTextStyle?.color,
            equals(TEMPColors.white),
          );
          expect(
            disabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });

        test('text style for enabled state', () {
          final enabledTextStyle = TEMPTheme()
              .darkTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({});
          expect(
            enabledTextStyle?.color,
            equals(TEMPColors.white),
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
