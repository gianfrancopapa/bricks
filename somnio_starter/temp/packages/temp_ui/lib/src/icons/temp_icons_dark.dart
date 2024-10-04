import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temp_ui/temp_ui.dart';

/// Icons to be used with dark theme.
class TEMPIconsDark extends TEMPIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? TEMPColors.white,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? TEMPColors.white,
      size: size ?? 14,
    );
  }
}
