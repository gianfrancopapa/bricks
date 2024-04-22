import 'package:facebook/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/helpers.dart';

void main() {
  late AppBloc mockAppBloc;
  late BuildContext mockBuildContext;

  setUp(() {
    mockAppBloc = MockAppBloc();
    mockBuildContext = MockBuildContext();
  });

  group('BuildContextX', () {
    test('user getter returns the user from AppBloc state', () {
      // Mock user
      const testUser = User(id: 'id', email: 'email');

      // Mock AppBloc state
      when(() => mockAppBloc.state).thenReturn(
        const AppState.authenticated(
          user: testUser,
        ),
      );

      // Provide the mock AppBloc using the context extension
      when(()=>mockBuildContext.read<AppBloc>()).thenReturn(mockAppBloc);

      // Test the extension method
      final user = mockBuildContext.user;

      // Verify that the extension method returns the correct user
      expect(user, equals(testUser));
    });
  });
}
