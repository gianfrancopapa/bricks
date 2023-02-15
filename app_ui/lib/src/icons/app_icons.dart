import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_ui/src/generated/assets.gen.dart';

abstract class APPIcon {
    ///Returns the back icon
  SvgPicture backIcon({double? size, Color? color}) {
    return Assets.icons.backIcon.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }

  ///Returns the email outline icon
  SvgPicture emailOutline({double? size, Color? color}) {
    return Assets.icons.emailOutline.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }

}
