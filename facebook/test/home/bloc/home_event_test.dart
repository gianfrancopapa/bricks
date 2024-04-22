import 'package:facebook/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(const HomeEvent().props, equals([]));
    expect(
      const HomeEvent(),
      const HomeEvent(),
    );
  });
}
