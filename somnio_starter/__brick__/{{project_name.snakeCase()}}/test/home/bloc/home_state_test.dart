import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

void main() {
  test('supports value comparison', () {
    expect(const HomeState().props, equals([]));
    expect(
      const HomeState(),
      const HomeState(),
    );
  });
}
