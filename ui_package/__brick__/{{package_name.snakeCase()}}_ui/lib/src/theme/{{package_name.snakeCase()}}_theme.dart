import 'package:flutter/material.dart';
import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';

abstract class {{short_name.upperCase()}}Theme {

  static final ThemeData themeData = ThemeData(
    primaryColor: {{short_name.upperCase()}}Colors.primaryColor,
  );

}
