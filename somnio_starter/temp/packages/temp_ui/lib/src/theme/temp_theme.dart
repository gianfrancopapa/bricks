import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_ui/temp_ui.dart';

/// A class that provides the theme for the app.
class TEMPTheme {

  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: TEMPColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: TEMPColors.transparent,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _lightColorScheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      dividerColor: TEMPColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: TEMPColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: TEMPColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: TEMPColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: TEMPColors.skyBlue,
      primaryContainer: TEMPColors.lightBlue200,
      onPrimaryContainer: TEMPColors.oceanBlue,
      secondary: TEMPColors.paleSky,
      onSecondary: TEMPColors.white,
      secondaryContainer: TEMPColors.lightBlue200,
      onSecondaryContainer: TEMPColors.oceanBlue,
      tertiary: TEMPColors.secondary.shade700,
      onTertiary: TEMPColors.white,
      tertiaryContainer: TEMPColors.secondary.shade300,
      onTertiaryContainer: TEMPColors.secondary.shade700,
      error: TEMPColors.red,
      errorContainer: TEMPColors.red.shade200,
      onErrorContainer: TEMPColors.redWine,
      surface: _backgroundColor,
      onSurface: TEMPColors.onBackground,
      surfaceContainerHighest: TEMPColors.surface,
      onSurfaceVariant: TEMPColors.grey,
      inversePrimary: TEMPColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        surface: TEMPColors.black,
        onSurface: TEMPColors.lightGrey,
        primary: TEMPColors.blue,
        onPrimary: TEMPColors.oceanBlue,
        primaryContainer: TEMPColors.oceanBlue,
        onPrimaryContainer: TEMPColors.lightBlue200,
        secondary: TEMPColors.paleSky,
        onSecondary: TEMPColors.lightGrey,
        secondaryContainer: TEMPColors.liver,
        onSecondaryContainer: TEMPColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => TEMPColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: TEMPColors.white,
      toolbarTextStyle: _lightTextTheme.titleLarge,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: TEMPColors.grey,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: TEMPColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: TEMPColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: TEMPColors.outlineLight,
      space: TEMPSpacing.lg,
      thickness: TEMPSpacing.xxxs,
      indent: TEMPSpacing.lg,
      endIndent: TEMPSpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: TEMPColors.white,
      displayColor: TEMPColors.white,
      decorationColor: TEMPColors.white,
    );
  }

  /// The UI text theme based on [TEMPTextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: TEMPTextStyle.headline1,
    displayMedium: TEMPTextStyle.headline2,
    displaySmall: TEMPTextStyle.headline3,
    titleMedium: TEMPTextStyle.subtitle1,
    titleSmall: TEMPTextStyle.subtitle2,
    bodyLarge: TEMPTextStyle.bodyText1,
    bodyMedium: TEMPTextStyle.bodyText2,
    labelLarge: TEMPTextStyle.button,
    bodySmall: TEMPTextStyle.caption,
    labelSmall: TEMPTextStyle.overline,
  ).apply(
    bodyColor: TEMPColors.black,
    displayColor: TEMPColors.black,
    decorationColor: TEMPColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: TEMPColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: TEMPColors.secondary.shade700,
      secondarySelectedColor: TEMPColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: TEMPTextStyle.button.copyWith(color: TEMPColors.black),
      secondaryLabelStyle:
          TEMPTextStyle.labelSmall.copyWith(color: TEMPColors.white),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(),
      ),
    );
  }

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _darkChipTheme {
    return _chipTheme.copyWith(
      backgroundColor: TEMPColors.white,
      disabledColor: _backgroundColor,
      selectedColor: TEMPColors.secondary.shade700,
      secondarySelectedColor: TEMPColors.secondary.shade700,
      labelStyle: TEMPTextStyle.button.copyWith(
        color: TEMPColors.secondary.shade700,
      ),
      secondaryLabelStyle: TEMPTextStyle.labelSmall.copyWith(
        color: TEMPColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: TEMPColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TEMPSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: TEMPSpacing.lg),
      buttonColor: TEMPColors.blue,
      disabledColor: TEMPColors.lightGrey,
      height: 48,
      minWidth: 48,
    );
  }

  /// Returns the correct [ElevatedButtonThemeData] based on the current theme.
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: TEMPSpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: TEMPFontWeight.bold,
        ),
        backgroundColor: TEMPColors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: TEMPFontWeight.light,
        ),
        foregroundColor: TEMPColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: TEMPFontWeight.light,
        ),
        foregroundColor: TEMPColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: TEMPColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TEMPSpacing.lg),
          topRight: Radius.circular(TEMPSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: TEMPColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: TEMPColors.onBackground,
      contentPadding: EdgeInsets.all(TEMPSpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return TEMPColors.darkAqua;
        }
        return TEMPColors.black;
      }),
      trackColor:
          WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return TEMPColors.primaryContainer;
        }
        return TEMPColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: TEMPColors.darkAqua,
      circularTrackColor: TEMPColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: TEMPTextStyle.button,
      labelColor: TEMPColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: TEMPSpacing.lg,
        vertical: TEMPSpacing.md + TEMPSpacing.xxs,
      ),
      unselectedLabelStyle: TEMPTextStyle.button,
      unselectedLabelColor: TEMPColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: TEMPColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: TEMPColors.black,
      selectedItemColor: TEMPColors.white,
      unselectedItemColor: TEMPColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(const StadiumBorder()),
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => TEMPColors.white,
        ),
        side: WidgetStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: TEMPSpacing.xlg,
            vertical: TEMPSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.disabled)
              ? TEMPTextStyle.button.copyWith(
                  color: TEMPColors.black,
                  fontWeight: FontWeight.w500,
                )
              : TEMPTextStyle.button.copyWith(
                  color: states.contains(WidgetState.disabled)
                      ? TEMPColors.black
                      : TEMPColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(const StadiumBorder()),
        backgroundColor: WidgetStateColor.resolveWith(
          (states) => TEMPColors.black,
        ),
        side: WidgetStateProperty.resolveWith(
          (states) => const BorderSide(color: TEMPColors.white),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: TEMPSpacing.xlg,
            vertical: TEMPSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.disabled)
              ? TEMPTextStyle.button.copyWith(
                  color: TEMPColors.white,
                  fontWeight: FontWeight.w500,
                )
              : TEMPTextStyle.button.copyWith(
                  color: states.contains(WidgetState.disabled)
                      ? TEMPColors.black
                      : TEMPColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
