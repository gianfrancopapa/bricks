import 'package:flutter/material.dart';
import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';

abstract class {{short_name.upperCase()}}Theme {

  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: AppColors.transparent,
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
      dividerColor: AppColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: AppColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: AppColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: AppColors.skyBlue,
      primaryContainer: AppColors.lightBlue200,
      onPrimaryContainer: AppColors.oceanBlue,
      secondary: AppColors.paleSky,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.lightBlue200,
      onSecondaryContainer: AppColors.oceanBlue,
      tertiary: AppColors.secondary.shade700,
      onTertiary: AppColors.white,
      tertiaryContainer: AppColors.secondary.shade300,
      onTertiaryContainer: AppColors.secondary.shade700,
      error: AppColors.red,
      errorContainer: AppColors.red.shade200,
      onErrorContainer: AppColors.redWine,
      background: _backgroundColor,
      onBackground: AppColors.onBackground,
      surfaceVariant: AppColors.surface2,
      onSurfaceVariant: AppColors.grey,
      inversePrimary: AppColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: AppColors.black,
        onBackground: AppColors.white,
        surface: AppColors.black,
        onSurface: AppColors.lightGrey,
        primary: AppColors.blue,
        onPrimary: AppColors.oceanBlue,
        primaryContainer: AppColors.oceanBlue,
        onPrimaryContainer: AppColors.lightBlue200,
        secondary: AppColors.paleSky,
        onSecondary: AppColors.lightGrey,
        secondaryContainer: AppColors.liver,
        onSecondaryContainer: AppColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => AppColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleLarge,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: AppColors.white,
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
      backgroundColor: AppColors.black,
      iconTheme: _darkAppBarIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleLarge,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: AppColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: AppColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.outlineLight,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      decorationColor: AppColors.white,
    );
  }

  /// The UI text theme based on [UITextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    headlineMedium: UITextStyle.headline4,
    headlineSmall: UITextStyle.headline5,
    titleLarge: UITextStyle.headline6,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: AppColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: AppColors.secondary.shade700,
      secondarySelectedColor: AppColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: UITextStyle.button.copyWith(color: AppColors.black),
      secondaryLabelStyle:
          UITextStyle.labelSmall.copyWith(color: AppColors.white),
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
      backgroundColor: AppColors.white,
      disabledColor: _backgroundColor,
      selectedColor: AppColors.secondary.shade700,
      secondarySelectedColor: AppColors.secondary.shade700,
      labelStyle: UITextStyle.button.copyWith(
        color: AppColors.secondary.shade700,
      ),
      secondaryLabelStyle: UITextStyle.labelSmall.copyWith(
        color: AppColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      buttonColor: AppColors.blue,
      disabledColor: AppColors.lightGrey,
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
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.bold,
        ),
        backgroundColor: AppColors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.lg),
          topRight: Radius.circular(AppSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: AppColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: AppColors.onBackground,
      contentPadding: EdgeInsets.all(AppSpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.darkAqua;
        }
        return AppColors.eerieBlack;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryContainer;
        }
        return AppColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.darkAqua,
      circularTrackColor: AppColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: AppColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md + AppSpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: AppColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: AppColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => AppColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
            vertical: AppSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? UITextStyle.button.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                )
              : UITextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? AppColors.black
                      : AppColors.white,
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
          (states) => AppColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: AppColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: AppSpacing.xlg,
            vertical: AppSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? UITextStyle.button.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                )
              : UITextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? AppColors.black
                      : AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

}
