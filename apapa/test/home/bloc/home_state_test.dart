import 'package:apapa/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(const HomeState().props, equals([]));
    expect(
      const HomeState(),
      const HomeState(),
    );
  });
}
