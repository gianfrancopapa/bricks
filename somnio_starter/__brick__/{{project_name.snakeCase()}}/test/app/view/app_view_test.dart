import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
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
  late OnCreateRouter mockOnCreateRouter;
  late AppBloc mockAppBloc;

  const testUser = User(id: 'id', email: 'email');

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockOnCreateRouter = onCreateRouter;
    mockAppBloc = MockAppBloc();

    when(() => mockAppBloc.state).thenReturn(const AppState.unauthenticated());
  });

  group('App', () {
    testWidgets('AppWidget should build correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        App(
          userRepository: mockUserRepository,
          onCreateRouter: mockOnCreateRouter,
          user: testUser,
        ),
      );

      expect(find.byType(MultiRepositoryProvider), findsOneWidget);
      expect(find.byType(BlocProvider<AppBloc>), findsOneWidget);
      expect(find.byType(AppView), findsOneWidget);
    });

    testWidgets('AppView should build correctly', (WidgetTester tester) async {
      await tester.pumpApp(
        AppView(
          onCreateRouter: mockOnCreateRouter,
          user: testUser,
        ),
        appBloc: mockAppBloc,
      );

      expect(find.byType(AppView), findsOneWidget);
    });
  });
}
