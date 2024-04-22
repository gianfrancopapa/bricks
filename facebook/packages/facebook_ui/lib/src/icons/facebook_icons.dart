import 'package:facebook_ui/src/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A class which contains all the icons used in the app
abstract class UIIcon {
  final _package = 'facebook_ui';

  ///Returns the back icon
  SvgPicture backIcon({double? size, Color? color}) {
    return Assets.icons.backIcon.svg(
      height: size ?? 14,
      width: size ?? 14,
      package: _package,
    );
  }

  ///Returns the email outline iconcd 
  SvgPicture emailOutline({double? size, Color? color}) {
    return Assets.icons.emailOutline.svg(
      height: size ?? 14,
      width: size ?? 14,
      package: _package,
    );
  }
}
