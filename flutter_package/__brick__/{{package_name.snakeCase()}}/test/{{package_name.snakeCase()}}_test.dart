import 'package:flutter_test/flutter_test.dart';
import 'package:{{package_name.snakeCase()}}/{{package_name.snakeCase()}}.dart';

void main() {
  group('{{package_name.pascalCase()}}', () {
    test('can be instantiated', () {
      expect(const {{package_name.pascalCase()}}(), isNotNull);
    });
  });
}
