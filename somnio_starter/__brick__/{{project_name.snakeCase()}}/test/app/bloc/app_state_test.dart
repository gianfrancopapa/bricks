import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  const testUser1 = User(id: 'test1', email: 'test@test.com');
  const testUser2 = User(id: 'test2', email: 'test2@test.com');

  group('AppState', () {
    test('supports value comparison', () {
      expect(
        const AppState(user: testUser1, status: AppStatus.authenticated),
        const AppState(user: testUser1, status: AppStatus.authenticated),
      );
    });

    test('two different instances with different users are not equal', () {
      expect(
        const AppState(user: testUser1, status: AppStatus.authenticated),
        isNot(const AppState(user: testUser2, status: AppStatus.authenticated)),
      );
    });

    test('AppState copyWith', () {
      const appState1 = AppState.authenticated(user: testUser1);
      final appState2 = appState1.copyWith(user: testUser2);

      expect(appState1.user, equals(testUser1));
      expect(appState2.user, equals(testUser2));
    });
  });
}
