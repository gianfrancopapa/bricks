import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/services.dart';

abstract class APPTheme {

  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: APPColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: APPColors.transparent,
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
      dividerColor: APPColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: APPColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: APPColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: APPColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: APPColors.skyBlue,
      primaryContainer: APPColors.lightBlue200,
      onPrimaryContainer: APPColors.oceanBlue,
      secondary: APPColors.paleSky,
      onSecondary: APPColors.white,
      secondaryContainer: APPColors.lightBlue200,
      onSecondaryContainer: APPColors.oceanBlue,
      tertiary: APPColors.secondary.shade700,
      onTertiary: APPColors.white,
      tertiaryContainer: APPColors.secondary.shade300,
      onTertiaryContainer: APPColors.secondary.shade700,
      error: APPColors.red,
      errorContainer: APPColors.red.shade200,
      onErrorContainer: APPColors.redWine,
      background: _backgroundColor,
      onBackground: APPColors.onBackground,
      surfaceVariant: APPColors.surface,
      onSurfaceVariant: APPColors.grey,
      inversePrimary: APPColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: APPColors.black,
        onBackground: APPColors.white,
        surface: APPColors.black,
        onSurface: APPColors.lightGrey,
        primary: APPColors.blue,
        onPrimary: APPColors.oceanBlue,
        primaryContainer: APPColors.oceanBlue,
        onPrimaryContainer: APPColors.lightBlue200,
        secondary: APPColors.paleSky,
        onSecondary: APPColors.lightGrey,
        secondaryContainer: APPColors.liver,
        onSecondaryContainer: APPColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => APPColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleLarge,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: APPColors.white,
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
      backgroundColor: APPColors.black,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleLarge,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: APPColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: APPColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: APPColors.outlineLight,
      space: APPSpacing.lg,
      thickness: APPSpacing.xxxs,
      indent: APPSpacing.lg,
      endIndent: APPSpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: APPColors.white,
      displayColor: APPColors.white,
      decorationColor: APPColors.white,
    );
  }

  /// The UI text theme based on [APPTextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: APPTextStyle.headline1,
    displayMedium: APPTextStyle.headline2,
    displaySmall: APPTextStyle.headline3,
    titleMedium: APPTextStyle.subtitle1,
    titleSmall: APPTextStyle.subtitle2,
    bodyLarge: APPTextStyle.bodyText1,
    bodyMedium: APPTextStyle.bodyText2,
    labelLarge: APPTextStyle.button,
    bodySmall: APPTextStyle.caption,
    labelSmall: APPTextStyle.overline,
  ).apply(
    bodyColor: APPColors.black,
    displayColor: APPColors.black,
    decorationColor: APPColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: APPColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: APPColors.secondary.shade700,
      secondarySelectedColor: APPColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: APPTextStyle.button.copyWith(color: APPColors.black),
      secondaryLabelStyle:
          APPTextStyle.labelSmall.copyWith(color: APPColors.white),
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
      backgroundColor: APPColors.white,
      disabledColor: _backgroundColor,
      selectedColor: APPColors.secondary.shade700,
      secondarySelectedColor: APPColors.secondary.shade700,
      labelStyle: APPTextStyle.button.copyWith(
        color: APPColors.secondary.shade700,
      ),
      secondaryLabelStyle: APPTextStyle.labelSmall.copyWith(
        color: APPColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: APPColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(APPSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: APPSpacing.lg),
      buttonColor: APPColors.blue,
      disabledColor: APPColors.lightGrey,
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
        padding: const EdgeInsets.symmetric(vertical: APPSpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: APPFontWeight.bold,
        ),
        backgroundColor: APPColors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: APPFontWeight.light,
        ),
        foregroundColor: APPColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: APPFontWeight.light,
        ),
        foregroundColor: APPColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: APPColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(APPSpacing.lg),
          topRight: Radius.circular(APPSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: APPColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: APPColors.onBackground,
      contentPadding: EdgeInsets.all(APPSpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return APPColors.darkAqua;
        }
        return APPColors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return APPColors.primaryContainer;
        }
        return APPColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: APPColors.darkAqua,
      circularTrackColor: APPColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: APPTextStyle.button,
      labelColor: APPColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: APPSpacing.lg,
        vertical: APPSpacing.md + APPSpacing.xxs,
      ),
      unselectedLabelStyle: APPTextStyle.button,
      unselectedLabelColor: APPColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: APPColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: APPColors.black,
      selectedItemColor: APPColors.white,
      unselectedItemColor: APPColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => APPColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: APPSpacing.xlg,
            vertical: APPSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? APPTextStyle.button.copyWith(
                  color: APPColors.black,
                  fontWeight: FontWeight.w500,
                )
              : APPTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? APPColors.black
                      : APPColors.white,
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
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => APPColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: APPColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: APPSpacing.xlg,
            vertical: APPSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? APPTextStyle.button.copyWith(
                  color: APPColors.white,
                  fontWeight: FontWeight.w500,
                )
              : APPTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? APPColors.black
                      : APPColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

}
