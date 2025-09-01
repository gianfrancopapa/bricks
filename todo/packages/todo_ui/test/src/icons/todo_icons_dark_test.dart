import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_ui/todo_ui.dart';

void main() {
  group('UIIconsDark Tests', () {
    test('Test Back icon', () {
      final appIcons = UIIconsDark();
      final svgPicture = appIcons.backIcon();

      expect(svgPicture, isA<SvgPicture>());
    });

    test('Test email logo icon', () {
      final appIcons = UIIconsDark();
      final svgPicture = appIcons.emailOutline();

      expect(svgPicture, isA<SvgPicture>());
    });
  });
}
