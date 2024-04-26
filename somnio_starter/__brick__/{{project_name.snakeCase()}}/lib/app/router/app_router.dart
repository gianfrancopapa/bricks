import 'package:{{project_name}}/app/constants/navigation_keys.dart';
import 'package:{{project_name}}/app/router/router.dart';
import 'package:{{project_name}}/authentication/delete_account/delete_account.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';
import 'package:{{project_name}}/down_for_maintenance/down_for_maintenance.dart';
import 'package:{{project_name}}/force_upgrade/force_upgrade.dart';
import 'package:{{project_name}}/home/home.dart';
import 'package:{{project_name}}/settings/settings.dart';
import 'package:go_router/go_router.dart';

export 'auth_stream_scope.dart';

class AppRouter {
  /// Only routes that are accessible to unauthenticated users
  static const onlyUnauthenticatedUserRoutes = <String>[
    SignUpPage.path,
    LoginPage.path,
    ForgotPasswordPage.path,
  ];

  /// Only routes that are accessible for authenticated users
  static const onlyAuthenticatedUserRoutes = <String>[
    HomePage.path,
    SettingsPage.path,
  ];

  static GoRouter router() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: LoginPage.path,
      redirect: (context, state) {
        final path = state.uri.path;
        final isAuthenticated = AppStatusStreamScope.of(context).isSignedIn;
        final isUnauthenticated = AppStatusStreamScope.of(context).isSignedOut;
        final isDownForMaintenance =
            AppStatusStreamScope.of(context).isDownForMaintenance;
        final forceUpgrade = AppStatusStreamScope.of(context).forceUpgrade;
        if (isDownForMaintenance) {
          return DownForMaintenancePage.path;
        }
        if (forceUpgrade) {
          return ForceUpgradePage.path;
        }
        if (onlyUnauthenticatedUserRoutes.contains(path) && isAuthenticated) {
          return HomePage.path;
        }
        if (onlyAuthenticatedUserRoutes.contains(path) && isUnauthenticated) {
          return LoginPage.path;
        }
        return null;
      },
      routes: [
        NavigationBarRouter(),
        GoRoute(
          path: SignUpPage.path,
          pageBuilder: (context, state) {
            return const SignUpPage();
          },
        ),
        GoRoute(
          path: LoginPage.path,
          pageBuilder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: DeleteAccountPage.path,
          pageBuilder: (context, state) {
            return const DeleteAccountPage();
          },
        ),
        GoRoute(
          path: ForgotPasswordPage.path,
          pageBuilder: (context, state) {
            return ForgotPasswordPage();
          },
        ),
        GoRoute(
          path: DownForMaintenancePage.path,
          pageBuilder: (context, state) {
            return const DownForMaintenancePage();
          },
        ),
        GoRoute(
          path: ForceUpgradePage.path,
          pageBuilder: (context, state) {
            return const ForceUpgradePage();
          },
        ),
        GoRoute(
          path: SettingsPage.path,
          pageBuilder: (context, state) {
            return const SettingsPage();
          },
        ),
      ],
    );
  }
}
