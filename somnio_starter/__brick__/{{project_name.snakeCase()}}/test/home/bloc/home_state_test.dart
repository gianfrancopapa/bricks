import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

void main() {
  test('supports value comparison', () {
    expect(
      const HomeState.initial().props,
      equals([const HomeState.initial().status, 0]),
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
