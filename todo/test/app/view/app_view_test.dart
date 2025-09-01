import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo/app/app.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Stream<User?> get user => Stream.value(null);
}

void main() {
  late UserRepository mockUserRepository;
  late AppBloc mockAppBloc;
  late ApiClient mockApiClient;
  late AppConfigRepository mockAppConfigRepository;
  const testUser = User(id: 'id', email: 'email');

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockAppBloc = MockAppBloc();
    mockApiClient = MockApiClient();

    // Configure AppConfigResource mock
    final mockAppConfigResource = MockAppConfigResource();
    when(() => mockApiClient.appConfigResource)
        .thenReturn(mockAppConfigResource);
    when(mockAppConfigResource.getUpgrade).thenAnswer(
      (_) async => const Upgrade(
        androidUpgradeUrl:
            'https://play.google.com/store/apps/details?id=com.example.todo',
        iosUpgradeUrl: 'https://apps.apple.com/app/todo/id123456789',
        androidBuildNumber: 1,
        iosBuildNumber: 1,
      ),
    );
    when(mockAppConfigResource.getDownForMaintenance).thenAnswer(
      (_) async => false,
    );

    mockAppConfigRepository = AppConfigRepository(
      buildNumber: 1,
      platform: Platform.android,
      apiClient: mockApiClient,
    );
    when(() => mockAppBloc.state).thenReturn(
      const AppState.unauthenticated(
        forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
        isDownForMaintenance: false,
      ),
    );
  });

  group('App', () {
    testWidgets('AppWidget should build correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: App(
            userRepository: mockUserRepository,
            user: testUser,
            appConfigRepository: mockAppConfigRepository,
          ),
        ),
      );

      expect(find.byType(MultiRepositoryProvider), findsOneWidget);
      expect(find.byType(BlocProvider<AppBloc>), findsOneWidget);
    });

    testWidgets('AppView should build correctly', (WidgetTester tester) async {
      // Create a simple router for testing
      final testRouter = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Scaffold(
              body: Text('Test'),
            ),
          ),
        ],
      );

      await tester.pumpWidget(
        BlocProvider<AppBloc>.value(
          value: mockAppBloc,
          child: AppView(
            routerConfig: testRouter,
          ),
        ),
      );

      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
