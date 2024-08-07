import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Stream<User?> get user => Stream.value(null);
}

void main() {
  late UserRepository mockUserRepository;
  late GoRouter mockRouterConfig;
  late AppBloc mockAppBloc;
  late ApiClient mockApiClient;
  late AppConfigRepository mockAppConfigRepository;
  const testUser = User(id: 'id', email: 'email');

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockRouterConfig = MockRouterConfig();
    mockAppBloc = MockAppBloc();
    mockApiClient = MockApiClient();
    mockAppConfigRepository = AppConfigRepository(
      buildNumber: 1,
      platform: Platform.android.isAndroid ? Platform.android : Platform.iOS,
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
        App(
          userRepository: mockUserRepository,
          user: testUser,
          appConfigRepository: mockAppConfigRepository,
        ),
      );

      expect(find.byType(MultiRepositoryProvider), findsOneWidget);
      expect(find.byType(BlocProvider<AppBloc>), findsOneWidget);
      expect(find.byType(AppView), findsOneWidget);
    });

    testWidgets('AppView should build correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        AppView(
          routerConfig: mockRouterConfig,
        ),
        appBloc: mockAppBloc,
      );

      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
