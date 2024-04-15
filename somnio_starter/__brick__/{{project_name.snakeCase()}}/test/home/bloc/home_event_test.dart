import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

void main() {
  test('supports value comparison', () {
    expect(const HomeEvent().props, equals([]));
    expect(
      const HomeEvent(),
      const HomeEvent(),
    );
  });
}
