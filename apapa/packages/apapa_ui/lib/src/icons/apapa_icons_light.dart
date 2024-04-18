import 'package:apapa_ui/apapa_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
