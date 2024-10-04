import 'package:flutter/material.dart';
import 'package:temp_ui/temp_ui.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct TEMPIcon based on the current theme
  TEMPIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return TEMPIconsDark();
    } else {
      return  TEMPIconsLight();
    }
  }
}
