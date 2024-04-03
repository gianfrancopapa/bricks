import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:{{project_name.snakeCase()}}_ui/src/generated/assets.gen.dart';

abstract class {{short_name.upperCase()}}Icon {
  final _package = 'icon_test_ui';

  ///Returns the back icon
  SvgPicture backIcon({double? size, Color? color}) {
    return Assets.icons.backIcon.svg(
      height: size ?? 14,
      width: size ?? 14,
      package: _package,
    );
  }

  ///Returns the email outline icon
  SvgPicture emailOutline({double? size, Color? color}) {
    return Assets.icons.emailOutline.svg(
      height: size ?? 14,
      width: size ?? 14,
      package: _package,
    );
  }

}
