import 'package:facebook/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('supports value comparison', () {
    expect(
      const HomeState.initial().props,
      equals([const HomeState.initial().status]),
    );
    expect(
      const HomeState.initial(),
      const HomeState.initial(),
    );
  });

  test('returns a copy with updated status', () {
    expect(
      const HomeState.initial().copyWith(status: HomeStatus.loading),
      const HomeState(status: HomeStatus.loading),
    );
    expect(const HomeState.initial().copyWith(), const HomeState.initial());
  });
}
