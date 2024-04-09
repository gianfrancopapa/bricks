import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Icons to be used with dark theme.
class {{short_name.upperCase()}}IconsDark extends {{short_name.upperCase()}}Icon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? {{short_name.upperCase()}}Colors.white,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? {{short_name.upperCase()}}Colors.white,
      size: size ?? 14,
    );
  }
}
