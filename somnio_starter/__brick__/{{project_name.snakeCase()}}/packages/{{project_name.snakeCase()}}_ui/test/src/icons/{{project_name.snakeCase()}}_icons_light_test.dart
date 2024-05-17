import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{short_name.upperCase()}}IconsLight Tests', () {
    test('Test Back icon', () {
      final appIcons = {{short_name.upperCase()}}IconsLight();
      final svgPicture = appIcons.back();

      expect(svgPicture, isA<SvgPicture>());
    });

    test('Test email logo icon', () {
      final appIcons = {{short_name.upperCase()}}IconsLight();
      final svgPicture = appIcons.emailOutline();

      expect(svgPicture, isA<SvgPicture>());
    });
  });
}
