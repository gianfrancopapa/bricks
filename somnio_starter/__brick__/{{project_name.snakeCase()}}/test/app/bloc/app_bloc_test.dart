import 'package:api_client/api_client.dart';
import 'package:app_config_repository/app_config_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/pump_app.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late UserRepository mockUserRepository;
  late AppConfigRepository appConfigRepository;
  late ApiClient mockApiClient;

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockApiClient = MockApiClient();
    appConfigRepository = AppConfigRepository(
      buildNumber: 201,
      platform: Platform.android,
      apiClient: mockApiClient,
    );
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
      act: (bloc) => bloc.add(const AppUserChanged(user: testUser)),
      expect: () => [
        const AppState.authenticated(
          user: testUser,
          forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
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
        const AppState.downForMaintenance(
          user: testUser,
          isDownForMaintenance: true,
          forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
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
        const AppState.authenticated(
          user: testUser,
          forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
          isDownForMaintenance: false,
        ),
      ],
    );
    blocTest<AppBloc, AppState>(
      'emits [AppState:AppState(null, AppStatus.unauthenticated), '
      'AppState:AppState(null, AppStatus.forceUpgrade)]'
      ' when nothing is added',
      setUp: () {
        appConfigRepository = AppConfigRepository(
          buildNumber: 140,
          platform: Platform.android,
          apiClient: mockApiClient,
        );
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
        const AppState(user: null, status: AppStatus.forceUpgrade),
      ],
    );
    blocTest<AppBloc, AppState>(
      'emits [AppState:AppState(null, AppStatus.unauthenticated), '
      'AppState:AppState(null, AppStatus.forceUpgrade)]'
      ' when nothing is added',
      setUp: () {
        appConfigRepository = AppConfigRepository(
          buildNumber: 100,
          platform: Platform.iOS,
          apiClient: mockApiClient,
        );
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
        const AppState(user: null, status: AppStatus.forceUpgrade),
      ],
    );
    blocTest<AppBloc, AppState>(
      'emits [AppState:AppState(null, AppStatus.unauthenticated), '
      'AppState:AppState(null, AppStatus.downForMaintenance)]'
      ' when nothing is added',
      setUp: () {
        appConfigRepository = AppConfigRepository(
          buildNumber: 99,
          platform: Platform.iOS,
          apiClient: mockApiClient,
        );
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
        const AppState(user: null, status: AppStatus.downForMaintenance),
      ],
    );
  });
}
