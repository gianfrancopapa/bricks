import 'package:app_config_repository/app_config_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository mockUserRepository;
  late AppConfigRepository appConfigRepository;
  setUp(() {
    mockUserRepository = MockUserRepository();
    appConfigRepository = AppConfigRepository(
      buildNumber: 100,
      platform: Platform.android,
    );
  });

  // ignore: prefer_const_constructors
  final testUser = User(id: 'test', email: 'test');

  group('AppBloc', () {
    blocTest<AppBloc, AppState>(
      'emits [AppState:AppState(null, AppStatus.unauthenticated)]'
      ' when nothing is added',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(null));
      },
      build: () => AppBloc(
        userRepository: mockUserRepository,
        user: testUser,
        appConfigRepository: appConfigRepository,
      ),
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
      build: () => AppBloc(
        userRepository: mockUserRepository,
        user: testUser,
        appConfigRepository: appConfigRepository,
      ),
      act: (bloc) => bloc.add(AppUserChanged(user: testUser)),
      expect: () => [
        AppState.authenticated(
          user: testUser,
          forceUpgrade: const ForceUpgrade(isUpgradeRequired: false),
          isDownForMaintenance: false,
        ),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits down for maintenance state after '
      'AppDownForMaintenanceStatusChanged event',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(null));
      },
      build: () => AppBloc(
        userRepository: mockUserRepository,
        user: testUser,
        appConfigRepository: appConfigRepository,
      ),
      act: (bloc) => bloc.add(
        const AppDownForMaintenanceStatusChanged(
          isDownForMaintenance: true,
        ),
      ),
      expect: () => [
        AppState.downForMaintenance(
          user: testUser,
          isDownForMaintenance: true,
          forceUpgrade: const ForceUpgrade(isUpgradeRequired: false),
        ),
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
      build: () => AppBloc(
        userRepository: mockUserRepository,
        user: testUser,
        appConfigRepository: appConfigRepository,
      ),
      act: (bloc) => bloc.add(const AppLogoutRequested()),
      expect: () => [
        const AppState.unauthenticated(
          forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
          isDownForMaintenance: false,
        ),
      ],
    );

    blocTest<AppBloc, AppState>(
      'emits previous state if !isDownForMaintenance'
      ' on AppDownForMaintenanceStatusChanged event',
      setUp: () {
        when(() => mockUserRepository.user)
            .thenAnswer((_) => Stream.value(testUser));
      },
      build: () => AppBloc(
        userRepository: mockUserRepository,
        user: testUser,
        appConfigRepository: appConfigRepository,
      ),
      act: (bloc) => bloc.add(
        const AppDownForMaintenanceStatusChanged(
          isDownForMaintenance: false,
        ),
      ),
      expect: () => [
        AppState.authenticated(
          user: testUser,
          forceUpgrade: const ForceUpgrade(isUpgradeRequired: false),
          isDownForMaintenance: false,
        ),
      ],
    );
  });
}
