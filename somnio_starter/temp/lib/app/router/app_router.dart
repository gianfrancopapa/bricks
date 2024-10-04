import 'package:go_router/go_router.dart';
import 'package:temp/app/constants/navigation_keys.dart';
import 'package:temp/app/router/router.dart';
import 'package:temp/authentication/delete_account/delete_account.dart';
import 'package:temp/authentication/forgot_password/forgot_password.dart';
import 'package:temp/authentication/login/login.dart';
import 'package:temp/authentication/sign_up/sign_up.dart';
import 'package:temp/down_for_maintenance/down_for_maintenance.dart';
import 'package:temp/force_upgrade/force_upgrade.dart';
import 'package:temp/home/home.dart';
import 'package:temp/settings/settings.dart';

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
