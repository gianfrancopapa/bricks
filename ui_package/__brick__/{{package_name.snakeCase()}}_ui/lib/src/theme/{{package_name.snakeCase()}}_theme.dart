import 'package:flutter/material.dart';
import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/services.dart';

/// A class that provides the theme for the app.
class {{short_name.upperCase()}}Theme {
  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: {{short_name.upperCase()}}Colors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: {{short_name.upperCase()}}Colors.transparent,
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
      dividerColor: {{short_name.upperCase()}}Colors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: {{short_name.upperCase()}}Colors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: {{short_name.upperCase()}}Colors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: {{short_name.upperCase()}}Colors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: {{short_name.upperCase()}}Colors.skyBlue,
      primaryContainer: {{short_name.upperCase()}}Colors.lightBlue200,
      onPrimaryContainer: {{short_name.upperCase()}}Colors.oceanBlue,
      secondary: {{short_name.upperCase()}}Colors.paleSky,
      onSecondary: {{short_name.upperCase()}}Colors.white,
      secondaryContainer: {{short_name.upperCase()}}Colors.lightBlue200,
      onSecondaryContainer: {{short_name.upperCase()}}Colors.oceanBlue,
      tertiary: {{short_name.upperCase()}}Colors.secondary.shade700,
      onTertiary: {{short_name.upperCase()}}Colors.white,
      tertiaryContainer: {{short_name.upperCase()}}Colors.secondary.shade300,
      onTertiaryContainer: {{short_name.upperCase()}}Colors.secondary.shade700,
      error: {{short_name.upperCase()}}Colors.red,
      errorContainer: {{short_name.upperCase()}}Colors.red.shade200,
      onErrorContainer: {{short_name.upperCase()}}Colors.redWine,
      background: _backgroundColor,
      onBackground: {{short_name.upperCase()}}Colors.onBackground,
      surfaceVariant: {{short_name.upperCase()}}Colors.surface,
      onSurfaceVariant: {{short_name.upperCase()}}Colors.grey,
      inversePrimary: {{short_name.upperCase()}}Colors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: {{short_name.upperCase()}}Colors.black,
        onBackground: {{short_name.upperCase()}}Colors.white,
        surface: {{short_name.upperCase()}}Colors.black,
        onSurface: {{short_name.upperCase()}}Colors.lightGrey,
        primary: {{short_name.upperCase()}}Colors.blue,
        onPrimary: {{short_name.upperCase()}}Colors.oceanBlue,
        primaryContainer: {{short_name.upperCase()}}Colors.oceanBlue,
        onPrimaryContainer: {{short_name.upperCase()}}Colors.lightBlue200,
        secondary: {{short_name.upperCase()}}Colors.paleSky,
        onSecondary: {{short_name.upperCase()}}Colors.lightGrey,
        secondaryContainer: {{short_name.upperCase()}}Colors.liver,
        onSecondaryContainer: {{short_name.upperCase()}}Colors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => {{short_name.upperCase()}}Colors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: {{short_name.upperCase()}}Colors.white,
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
      backgroundColor: {{short_name.upperCase()}}Colors.grey,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: {{short_name.upperCase()}}Colors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: {{short_name.upperCase()}}Colors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: {{short_name.upperCase()}}Colors.outlineLight,
      space: {{short_name.upperCase()}}Spacing.lg,
      thickness: {{short_name.upperCase()}}Spacing.xxxs,
      indent: {{short_name.upperCase()}}Spacing.lg,
      endIndent: {{short_name.upperCase()}}Spacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: {{short_name.upperCase()}}Colors.white,
      displayColor: {{short_name.upperCase()}}Colors.white,
      decorationColor: {{short_name.upperCase()}}Colors.white,
    );
  }

  /// The UI text theme based on [{{short_name.upperCase()}}TextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: {{short_name.upperCase()}}TextStyle.headline1,
    displayMedium: {{short_name.upperCase()}}TextStyle.headline2,
    displaySmall: {{short_name.upperCase()}}TextStyle.headline3,
    titleMedium: {{short_name.upperCase()}}TextStyle.subtitle1,
    titleSmall: {{short_name.upperCase()}}TextStyle.subtitle2,
    bodyLarge: {{short_name.upperCase()}}TextStyle.bodyText1,
    bodyMedium: {{short_name.upperCase()}}TextStyle.bodyText2,
    labelLarge: {{short_name.upperCase()}}TextStyle.button,
    bodySmall: {{short_name.upperCase()}}TextStyle.caption,
    labelSmall: {{short_name.upperCase()}}TextStyle.overline,
  ).apply(
    bodyColor: {{short_name.upperCase()}}Colors.black,
    displayColor: {{short_name.upperCase()}}Colors.black,
    decorationColor: {{short_name.upperCase()}}Colors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: {{short_name.upperCase()}}Colors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: {{short_name.upperCase()}}Colors.secondary.shade700,
      secondarySelectedColor: {{short_name.upperCase()}}Colors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: {{short_name.upperCase()}}TextStyle.button.copyWith(color: {{short_name.upperCase()}}Colors.black),
      secondaryLabelStyle:
          {{short_name.upperCase()}}TextStyle.labelSmall.copyWith(color: {{short_name.upperCase()}}Colors.white),
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
      backgroundColor: {{short_name.upperCase()}}Colors.white,
      disabledColor: _backgroundColor,
      selectedColor: {{short_name.upperCase()}}Colors.secondary.shade700,
      secondarySelectedColor: {{short_name.upperCase()}}Colors.secondary.shade700,
      labelStyle: {{short_name.upperCase()}}TextStyle.button.copyWith(
        color: {{short_name.upperCase()}}Colors.secondary.shade700,
      ),
      secondaryLabelStyle: {{short_name.upperCase()}}TextStyle.labelSmall.copyWith(
        color: {{short_name.upperCase()}}Colors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: {{short_name.upperCase()}}Colors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular({{short_name.upperCase()}}Spacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: {{short_name.upperCase()}}Spacing.lg),
      buttonColor: {{short_name.upperCase()}}Colors.blue,
      disabledColor: {{short_name.upperCase()}}Colors.lightGrey,
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
        padding: const EdgeInsets.symmetric(vertical: {{short_name.upperCase()}}Spacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: {{short_name.upperCase()}}FontWeight.bold,
        ),
        backgroundColor: {{short_name.upperCase()}}Colors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: {{short_name.upperCase()}}FontWeight.light,
        ),
        foregroundColor: {{short_name.upperCase()}}Colors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: {{short_name.upperCase()}}FontWeight.light,
        ),
        foregroundColor: {{short_name.upperCase()}}Colors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: {{short_name.upperCase()}}Colors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular({{short_name.upperCase()}}Spacing.lg),
          topRight: Radius.circular({{short_name.upperCase()}}Spacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: {{short_name.upperCase()}}Colors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: {{short_name.upperCase()}}Colors.onBackground,
      contentPadding: EdgeInsets.all({{short_name.upperCase()}}Spacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return {{short_name.upperCase()}}Colors.darkAqua;
        }
        return {{short_name.upperCase()}}Colors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return {{short_name.upperCase()}}Colors.primaryContainer;
        }
        return {{short_name.upperCase()}}Colors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: {{short_name.upperCase()}}Colors.darkAqua,
      circularTrackColor: {{short_name.upperCase()}}Colors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: {{short_name.upperCase()}}TextStyle.button,
      labelColor: {{short_name.upperCase()}}Colors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: {{short_name.upperCase()}}Spacing.lg,
        vertical: {{short_name.upperCase()}}Spacing.md + {{short_name.upperCase()}}Spacing.xxs,
      ),
      unselectedLabelStyle: {{short_name.upperCase()}}TextStyle.button,
      unselectedLabelColor: {{short_name.upperCase()}}Colors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: {{short_name.upperCase()}}Colors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: {{short_name.upperCase()}}Colors.black,
      selectedItemColor: {{short_name.upperCase()}}Colors.white,
      unselectedItemColor: {{short_name.upperCase()}}Colors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => {{short_name.upperCase()}}Colors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: {{short_name.upperCase()}}Spacing.xlg,
            vertical: {{short_name.upperCase()}}Spacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? {{short_name.upperCase()}}TextStyle.button.copyWith(
                  color: {{short_name.upperCase()}}Colors.black,
                  fontWeight: FontWeight.w500,
                )
              : {{short_name.upperCase()}}TextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? {{short_name.upperCase()}}Colors.black
                      : {{short_name.upperCase()}}Colors.white,
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
          (states) => {{short_name.upperCase()}}Colors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: {{short_name.upperCase()}}Colors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: {{short_name.upperCase()}}Spacing.xlg,
            vertical: {{short_name.upperCase()}}Spacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? {{short_name.upperCase()}}TextStyle.button.copyWith(
                  color: {{short_name.upperCase()}}Colors.white,
                  fontWeight: FontWeight.w500,
                )
              : {{short_name.upperCase()}}TextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? {{short_name.upperCase()}}Colors.black
                      : {{short_name.upperCase()}}Colors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
