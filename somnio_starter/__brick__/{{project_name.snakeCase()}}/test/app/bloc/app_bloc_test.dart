import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  const testUser = User(id: 'test', email: 'test');

  group('AppBloc', () {
    blocTest<AppBloc, AppState>(
      'emits [] when nothing is added',
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.toAuthListenable(user: testUser),
      expect: () => <AppState>[],
    );

    blocTest<AppBloc, AppState>(
      'emits authenticated state after AppUserChanged event',
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(const AppUserChanged(user: testUser)),
      expect: () => [const AppState.authenticated(user: testUser)],
    );

    blocTest<AppBloc, AppState>(
      'emits down for maintenance state after AppDownForMaintenanceStatusChanged event',
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(
        const AppDownForMaintenanceStatusChanged(
          isDownForMaintenance: true,
        ),
      ),
      expect: () => [const AppState.downForMaintenance()],
    );

    blocTest<AppBloc, AppState>(
      'emits unauthenticated state after AppLogoutRequested event',
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(const AppLogoutRequested()),
      expect: () => [const AppState.unauthenticated()],
    );
  });
}
