import 'package:app_config_repository/app_config_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  late AppBloc mockAppBloc;

  setUp(() {
    mockAppBloc = MockAppBloc();
  });

  group('BuildContextX', () {
    testWidgets('user getter returns the user from AppBloc state',
        (tester) async {
      // Mock user
      const testUser = User(id: 'id', email: 'email');

      // Mock AppBloc state
      when(() => mockAppBloc.state).thenReturn(
        const AppState.authenticated(
          user: testUser,
          forceUpgrade: ForceUpgrade(isUpgradeRequired: false),
          isDownForMaintenance: false,
        ),
      );

      late User? actualUser;

      await tester.pumpWidget(
        BlocProvider<AppBloc>.value(
          value: mockAppBloc,
          child: Builder(
            builder: (context) {
              actualUser = context.user;
              return Container();
            },
          ),
        ),
      );

      // Verify that the extension method returns the correct user
      expect(actualUser, equals(testUser));
    });
  });
}
