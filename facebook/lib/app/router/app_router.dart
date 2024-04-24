import 'package:facebook/app/constants/navigation_keys.dart';
import 'package:facebook/app/router/router.dart';
import 'package:facebook/authentication/delete_account/delete_account.dart';
import 'package:facebook/authentication/forgot_password/forgot_password.dart';
import 'package:facebook/authentication/login/login.dart';
import 'package:facebook/authentication/sign_up/sign_up.dart';
import 'package:facebook/down_for_maintenance/down_for_maintenance.dart';
import 'package:facebook/forge_upgrade/forge_upgrade.dart';
import 'package:facebook/home/home.dart';
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
        final mustUpdate = AppStatusStreamScope.of(context).mustUpdate;
        if (onlyUnauthenticatedUserRoutes.contains(path) && isAuthenticated) {
          return HomePage.path;
        }
        if (onlyAuthenticatedUserRoutes.contains(path) && isUnauthenticated) {
          return LoginPage.path;
        }
        if (isDownForMaintenance) {
          return DownForMaintenancePage.path;
        }
        if (mustUpdate) {
          return ForceUpgradePage.path;
        }
        return null;
      },
      routes: [
        GoRoute(
          path: HomePage.path,
          pageBuilder: (context, state) {
            return const HomePage();
          },
        ),
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
      ],
    );
  }
}
