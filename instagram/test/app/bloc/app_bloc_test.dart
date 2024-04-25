import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram/app/app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  const testUser = User(id: 'test', email: 'test');

  group('AppBloc', () {
    blocTest<AppBloc, AppState>(
      'emits [AppState:AppState(null, AppStatus.unauthenticated)]'
      ' when nothing is added',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(null));
      },
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      expect: () => <AppState>[
        const AppState(user: null, status: AppStatus.unauthenticated),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits authenticated state after AppUserChanged event',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(testUser));
      },
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(const AppUserChanged(user: testUser)),
      expect: () => [const AppState.authenticated(user: testUser)],
    );

    blocTest<AppBloc, AppState>(
      'emits down for maintenance state after '
      'AppDownForMaintenanceStatusChanged event',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(null));
      },
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(
        const AppDownForMaintenanceStatusChanged(
          isDownForMaintenance: true,
        ),
      ),
      expect: () => [
        const AppState.downForMaintenance(user: testUser),
        const AppState(user: null, status: AppStatus.unauthenticated),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits unauthenticated state after AppLogoutRequested event',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(null));
        when(() => mockUserRepository.signOut())
            .thenAnswer((invocation) => Future.value());
      },
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(const AppLogoutRequested()),
      expect: () => [const AppState.unauthenticated()],
    );

    blocTest<AppBloc, AppState>(
      'emits previous state if !isDownForMaintenance'
      ' on AppDownForMaintenanceStatusChanged event',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(testUser));
      },
      build: () => AppBloc(userRepository: mockUserRepository, user: testUser),
      act: (bloc) => bloc.add(
        const AppDownForMaintenanceStatusChanged(
          isDownForMaintenance: false,
        ),
      ),
      expect: () => [const AppState.authenticated(user: testUser)],
    );
  });
}
