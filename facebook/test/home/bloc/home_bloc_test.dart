import 'package:bloc_test/bloc_test.dart';
import 'package:facebook/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeBloc', () {
    blocTest<HomeBloc, HomeState>(
      'emits [] when nothing is added',
      build: HomeBloc.new,
      expect: () => <HomeState>[],
    );
  });
}
