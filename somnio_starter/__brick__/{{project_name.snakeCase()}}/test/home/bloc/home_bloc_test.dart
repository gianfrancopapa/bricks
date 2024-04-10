import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/home/home.dart';

void main() {
  group('HomeBloc', () {
    blocTest<HomeBloc, HomeState>(
      'emits [] when nothing is added',
      build: HomeBloc.new,
      expect: () => <HomeState>[],
    );
  });
}
