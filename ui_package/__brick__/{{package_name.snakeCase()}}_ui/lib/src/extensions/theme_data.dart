import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct {{short_name.upperCase()}}Icon based on the current theme
  {{short_name.upperCase()}}Icon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return {{short_name.upperCase()}}IconsDark();
    } else {
      return {{short_name.upperCase()}}IconsLight();
    }
  }
}
