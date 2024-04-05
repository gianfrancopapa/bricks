import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  late UserRepository mockUserRepository;
  late OnCreateRouter mockOnCreateRouter;

  const testUser = User(id: 'id', email: 'email');

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockOnCreateRouter = onCreateRouter;
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
      final mockAppBloc = AppBloc(user: testUser, userRepository: mockUserRepository);
      when(() => mockAppBloc.toAuthListenable(user: testUser)).thenReturn(
        MockAuthListenable(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockAppBloc,
            child: AppView(
              onCreateRouter: mockOnCreateRouter,
              user: testUser,
            ),
          ),
        ),
      );

      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
