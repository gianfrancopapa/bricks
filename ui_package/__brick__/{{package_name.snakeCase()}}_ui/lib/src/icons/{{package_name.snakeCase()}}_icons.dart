import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{package_name.snakeCase()}}_ui/src/generated/assets.gen.dart';

/// A class which contains all the icons used in the app
abstract class {{short_name.upperCase()}}Icon {
  final _package = '{{package_name.snakeCase()}}_ui';

  ///Returns the back icon
  SvgPicture backIcon({double? size, Color? color}) {
    return Assets.icons.backIcon.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
      package: _package,
    );
  }

  ///Returns the email outline icon
  SvgPicture emailOutline({double? size, Color? color}) {
    return Assets.icons.emailOutline.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
      package: _package,
    );
  }
}
