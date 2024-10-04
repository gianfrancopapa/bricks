import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:temp_ui/temp_ui.dart';

/// Icons to be used with light theme.
class UIIconsLight extends UIIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? UIColors.black,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? UIColors.black,
      size: size ?? 14,
    );
  }
}
