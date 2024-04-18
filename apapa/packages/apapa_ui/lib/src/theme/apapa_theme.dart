import 'package:apapa_ui/apapa_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A class that provides the theme for the app.
class UITheme {

  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: UIColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: UIColors.transparent,
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
      dividerColor: UIColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: UIColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: UIColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: UIColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: UIColors.skyBlue,
      primaryContainer: UIColors.lightBlue200,
      onPrimaryContainer: UIColors.oceanBlue,
      secondary: UIColors.paleSky,
      onSecondary: UIColors.white,
      secondaryContainer: UIColors.lightBlue200,
      onSecondaryContainer: UIColors.oceanBlue,
      tertiary: UIColors.secondary.shade700,
      onTertiary: UIColors.white,
      tertiaryContainer: UIColors.secondary.shade300,
      onTertiaryContainer: UIColors.secondary.shade700,
      error: UIColors.red,
      errorContainer: UIColors.red.shade200,
      onErrorContainer: UIColors.redWine,
      background: _backgroundColor,
      onBackground: UIColors.onBackground,
      surfaceVariant: UIColors.surface,
      onSurfaceVariant: UIColors.grey,
      inversePrimary: UIColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: UIColors.black,
        onBackground: UIColors.white,
        surface: UIColors.black,
        onSurface: UIColors.lightGrey,
        primary: UIColors.blue,
        onPrimary: UIColors.oceanBlue,
        primaryContainer: UIColors.oceanBlue,
        onPrimaryContainer: UIColors.lightBlue200,
        secondary: UIColors.paleSky,
        onSecondary: UIColors.lightGrey,
        secondaryContainer: UIColors.liver,
        onSecondaryContainer: UIColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => UIColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: UIColors.white,
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
      backgroundColor: UIColors.grey,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: UIColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: UIColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: UIColors.outlineLight,
      space: UISpacing.lg,
      thickness: UISpacing.xxxs,
      indent: UISpacing.lg,
      endIndent: UISpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: UIColors.white,
      displayColor: UIColors.white,
      decorationColor: UIColors.white,
    );
  }

  /// The UI text theme based on [UITextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: UIColors.black,
    displayColor: UIColors.black,
    decorationColor: UIColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: UIColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: UIColors.secondary.shade700,
      secondarySelectedColor: UIColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: UITextStyle.button.copyWith(color: UIColors.black),
      secondaryLabelStyle:
          UITextStyle.labelSmall.copyWith(color: UIColors.white),
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
      backgroundColor: UIColors.white,
      disabledColor: _backgroundColor,
      selectedColor: UIColors.secondary.shade700,
      secondarySelectedColor: UIColors.secondary.shade700,
      labelStyle: UITextStyle.button.copyWith(
        color: UIColors.secondary.shade700,
      ),
      secondaryLabelStyle: UITextStyle.labelSmall.copyWith(
        color: UIColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: UIColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: UISpacing.lg),
      buttonColor: UIColors.blue,
      disabledColor: UIColors.lightGrey,
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
        padding: const EdgeInsets.symmetric(vertical: UISpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: UIFontWeight.bold,
        ),
        backgroundColor: UIColors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: UIFontWeight.light,
        ),
        foregroundColor: UIColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: UIFontWeight.light,
        ),
        foregroundColor: UIColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: UIColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(UISpacing.lg),
          topRight: Radius.circular(UISpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: UIColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: UIColors.onBackground,
      contentPadding: EdgeInsets.all(UISpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return UIColors.darkAqua;
        }
        return UIColors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return UIColors.primaryContainer;
        }
        return UIColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: UIColors.darkAqua,
      circularTrackColor: UIColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: UIColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: UISpacing.lg,
        vertical: UISpacing.md + UISpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: UIColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: UIColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: UIColors.black,
      selectedItemColor: UIColors.white,
      unselectedItemColor: UIColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => UIColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: UISpacing.xlg,
            vertical: UISpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? UITextStyle.button.copyWith(
                  color: UIColors.black,
                  fontWeight: FontWeight.w500,
                )
              : UITextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? UIColors.black
                      : UIColors.white,
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
          (states) => UIColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: UIColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: UISpacing.xlg,
            vertical: UISpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? UITextStyle.button.copyWith(
                  color: UIColors.white,
                  fontWeight: FontWeight.w500,
                )
              : UITextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? UIColors.black
                      : UIColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
