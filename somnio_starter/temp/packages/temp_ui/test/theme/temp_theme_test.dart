import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temp_ui/temp_ui.dart';

void main() {
  group('UILightTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is sky blue', () {
          expect(
            UITheme().lightTheme.colorScheme.primary,
            UIColors.skyBlue,
          );
        });

        test('secondary is UIColors.paleSky', () {
          expect(
            UITheme().lightTheme.colorScheme.secondary,
            UIColors.paleSky,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is UISpacing.lg', () {
          expect(
            UITheme().lightTheme.dividerTheme.indent,
            UISpacing.lg,
          );
          expect(
            UITheme().lightTheme.dividerTheme.endIndent,
            UISpacing.lg,
          );
        });

        test('space is UISpacing.lg', () {
          expect(
            UITheme().lightTheme.dividerTheme.space,
            UISpacing.lg,
          );
        });
      });

      group('switchTheme', () {
        group('thumbColor', () {
          test('returns darkAqua when selected', () {
            expect(
              UITheme()
                  .lightTheme
                  .switchTheme
                  .thumbColor
                  ?.resolve({WidgetState.selected}),
              equals(UIColors.darkAqua),
            );
          });

          test('returns black when not selected', () {
            expect(
              UITheme().lightTheme.switchTheme.thumbColor?.resolve({}),
              equals(UIColors.black),
            );
          });
        });

        group('trackColor', () {
          test('returns primaryContainer when selected', () {
            expect(
              UITheme()
                  .lightTheme
                  .switchTheme
                  .trackColor
                  ?.resolve({WidgetState.selected}),
              equals(UIColors.primaryContainer),
            );
          });

          test('returns paleSky when not selected', () {
            expect(
              UITheme().lightTheme.switchTheme.trackColor?.resolve({}),
              equals(UIColors.paleSky),
            );
          });
        });
      });

      group('progressIndicatorTheme', () {
        test('color is UIColors.darkAqua', () {
          expect(
            UITheme().lightTheme.progressIndicatorTheme.color,
            equals(UIColors.darkAqua),
          );
        });

        test('circularTrackColor is UIColors.borderOutline', () {
          expect(
            UITheme()
                .lightTheme
                .progressIndicatorTheme
                .circularTrackColor,
            equals(UIColors.borderOutline),
          );
        });
      });

      group('lightOutlinedButtonTheme', () {
        test('shape is StadiumBorder', () {
          expect(
            UITheme().lightTheme.outlinedButtonTheme.style?.shape?.resolve({}),
            const StadiumBorder(),
          );
        });

        test('background color is UIColors.white', () {
          expect(
            UITheme()
                .lightTheme
                .outlinedButtonTheme
                .style
                ?.backgroundColor!
                .resolve({}),
            equals(UIColors.white),
          );
        });

        test('side is BorderSide', () {
          expect(
            UITheme().lightTheme.outlinedButtonTheme.style?.side!.resolve({}),
            equals(const BorderSide()),
          );
        });

        test(
            'padding is EdgeInsets.symmetric(horizontal: UISpacing.xlg, vertical: UISpacing.lg)',
            () {
          expect(
            UITheme().lightTheme.outlinedButtonTheme.style?.padding!.resolve({}),
            equals(
              const EdgeInsets.symmetric(
                horizontal: UISpacing.xlg,
                vertical: UISpacing.lg,
              ),
            ),
          );
        });

        test('alignment is Alignment.center', () {
          expect(
            UITheme().lightTheme.outlinedButtonTheme.style?.alignment,
            equals(Alignment.center),
          );
        });

        test('text style for disabled state', () {
          final disabledTextStyle = UITheme()
              .lightTheme
              .outlinedButtonTheme
              .style
              ?.textStyle!
              .resolve({WidgetState.disabled});
          expect(
            disabledTextStyle?.color,
            equals(UIColors.black),
          );
          expect(
            disabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });

        test('text style for enabled state', () {
          final enabledTextStyle = UITheme()
              .lightTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({});
          expect(
            enabledTextStyle?.color,
            equals(UIColors.white),
          );
          expect(
            enabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });
      });
    });
  });

  group('UIDarkTheme', () {
    group('themeData', () {
      group('color', () {
        test('primary is blue', () {
          expect(
            UITheme().darkTheme.colorScheme.primary,
            UIColors.blue,
          );
        });

        test('secondary is UIColors.paleSky', () {
          expect(
            UITheme().darkTheme.colorScheme.secondary,
            UIColors.paleSky,
          );
        });

        test('background is black', () {
          expect(
            UITheme().darkTheme.colorScheme.surface,
            UIColors.black,
          );
        });
      });

      group('divider', () {
        test('horizontal padding is UISpacing.lg', () {
          expect(
            UITheme().darkTheme.dividerTheme.indent,
            UISpacing.lg,
          );
          expect(
            UITheme().darkTheme.dividerTheme.endIndent,
            UISpacing.lg,
          );
        });

        test('space is UISpacing.lg', () {
          expect(
            UITheme().darkTheme.dividerTheme.space,
            UISpacing.lg,
          );
        });
      });

      group('darkOutlinedButtonTheme', () {
        test('shape is StadiumBorder', () {
          expect(
            UITheme().darkTheme.outlinedButtonTheme.style?.shape?.resolve({}),
            const StadiumBorder(),
          );
        });

        test('background color is UIColors.black', () {
          expect(
            UITheme()
                .darkTheme
                .outlinedButtonTheme
                .style
                ?.backgroundColor
                ?.resolve({}),
            equals(UIColors.black),
          );
        });

        test('side color is UIColors.white', () {
          expect(
            UITheme()
                .darkTheme
                .outlinedButtonTheme
                .style
                ?.side
                ?.resolve({})?.color,
            equals(UIColors.white),
          );
        });

        test(
            'padding is EdgeInsets.symmetric(horizontal: UISpacing.xlg, vertical: UISpacing.lg)',
            () {
          expect(
            UITheme().darkTheme.outlinedButtonTheme.style?.padding?.resolve({}),
            equals(
              const EdgeInsets.symmetric(
                horizontal: UISpacing.xlg,
                vertical: UISpacing.lg,
              ),
            ),
          );
        });

        test('alignment is Alignment.center', () {
          expect(
            UITheme().darkTheme.outlinedButtonTheme.style?.alignment,
            equals(Alignment.center),
          );
        });

        test('text style for disabled state', () {
          final disabledTextStyle = UITheme()
              .darkTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({WidgetState.disabled});
          expect(
            disabledTextStyle?.color,
            equals(UIColors.white),
          );
          expect(
            disabledTextStyle?.fontWeight,
            equals(FontWeight.w500),
          );
        });

        test('text style for enabled state', () {
          final enabledTextStyle = UITheme()
              .darkTheme
              .outlinedButtonTheme
              .style
              ?.textStyle
              ?.resolve({});
          expect(
            enabledTextStyle?.color,
            equals(UIColors.white),
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
