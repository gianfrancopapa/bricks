import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

class Test{{short_name.upperCase()}}Icons extends {{short_name.upperCase()}}Icons {}

void main() {
  group('{{short_name.upperCase()}}Icons Tests', () {
    test('Test Back icon', () {
      final appIcons = Test{{short_name.upperCase()}}Icons;
      final svgPicture = appIcons.back();

      expect(svgPicture, isA<SvgPicture>());
    });

    test('Test email logo icon', () {
      final appIcons = Test{{short_name.upperCase()}}Icons;
      final svgPicture = appIcons.emailOutline();

      expect(svgPicture, isA<SvgPicture>());
    });
  });
}
