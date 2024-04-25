import 'package:flutter_test/flutter_test.dart';
import 'package:instagram/home/home.dart';

void main() {
  test('supports value comparison', () {
    expect(const HomeEvent().props, equals([]));
    expect(
      const HomeEvent(),
      const HomeEvent(),
    );
  });
}
