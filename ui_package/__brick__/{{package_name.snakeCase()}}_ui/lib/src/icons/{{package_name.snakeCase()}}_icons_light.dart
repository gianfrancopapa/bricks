import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Icons to be used with light theme.
class {{short_name.upperCase()}}IconsLight extends {{short_name.upperCase()}}Icon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? {{short_name.upperCase()}}Colors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? {{short_name.upperCase()}}Colors.black,
      size: size ?? 14,
    );
  }
}

