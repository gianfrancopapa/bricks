import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/app/router/router.dart';
import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
import 'package:{{project_name}}/authentication/sign_up/sign_up.dart';
import 'package:user_repository/user_repository.dart';

export 'router_listenable.dart';

typedef OnCreateRouter = GoRouter Function({
  required User? user,
  required AuthListenable authListenable,
});

GoRouter onCreateRouter({
  required User? user,
  required AuthListenable authListenable,
}) {
  return AppRouter.router(
    user: user,
    authListenable: authListenable,
  );
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  /// Only routes that are accessible to unauthenticated users
  static const onlyUnauthenticatedUserRoutes = <String>[
    /*SignUpRoute.routePath,
    LoginRoute.routePath,
    ForgotPasswordRoute.routePath,
    ResetPasswordRoute.routePath,*/
  ];

  /// Only routes that are accessible for authenticated users
  static const onlyAuthenticatedUserRoutes = <String>[];

  static GoRouter router({
    required User? user,
    required AuthListenable authListenable,
  }) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: LoginPage.path,
      refreshListenable: authListenable,
      routes: [
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
          path: ForgotPasswordPage.path,
          pageBuilder: (context, state) {
            return ForgotPasswordPage();
          },
        ),
      ],
    );
  }
}
