import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  const user1 = User(id: '1', email: 'test@test.com');
  const user2 = User(id: '2', email: 'test2@test.com');
  group('AppEvent', () {
    group('AppUserChanged', () {
      test('supports value comparison', () {
        expect(
          const AppUserChanged(user: user1),
          const AppUserChanged(user: user1),
        );
      });

      test('two different instances with different users are not equal', () {
        expect(
          const AppUserChanged(user: user1),
          isNot(const AppUserChanged(user: user2)),
        );
      });
    });

    group(AppDownForMaintenanceStatusChanged, () {
      test('supports comparison', () {
        const appDown1 =
            AppDownForMaintenanceStatusChanged(isDownForMaintenance: true);
        const appDown2 =
            AppDownForMaintenanceStatusChanged(isDownForMaintenance: true);

        expect(appDown1, equals(appDown2));
      });

      test('two different instances with different values are not equal', () {
        const appDown1 =
            AppDownForMaintenanceStatusChanged(isDownForMaintenance: true);
        const appDown2 =
            AppDownForMaintenanceStatusChanged(isDownForMaintenance: false);

        expect(appDown1, isNot(appDown2));
      });
    });

    test('AppLogoutRequested supports comparison', () {
      const appLogoutRequested1 = AppLogoutRequested();
      const appLogoutRequested2 = AppLogoutRequested();

      expect(appLogoutRequested1.props, equals([]));
      expect(appLogoutRequested1, equals(appLogoutRequested2));
    });
  });
}
