import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/app/router/router.dart';
//import 'package:{{project_name}}/authentication/forgot_password/forgot_password.dart';
//import 'package:{{project_name}}/home/home.dart';
import 'package:{{project_name}}/authentication/login/login.dart';
//import 'package:{{project_name}}/authentication/reset_password/reset_password.dart';
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
      //initialLocation: HomeRoute.path,
      refreshListenable: authListenable,
      redirect: (context, state) {
        final path = state.uri.path;
        user = authListenable.value;
        final userIsAuthenticated = user != null;

        if (onlyUnauthenticatedUserRoutes.contains(path) &&
            userIsAuthenticated) {
          //return HomeRoute.path;
        }
        if (onlyAuthenticatedUserRoutes.contains(path) &&
            !userIsAuthenticated) {
          //return '${LoginRoute.routePath}?actionRequired=$path';
        }
        return null;
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<SignUpBloc>(
                  create: (ctx) => SignUpBloc(
                      /*userRepository: ctx.read<UserRepository>()*/),
                ),
              ],
              child: child,
            );
          },
          routes: [],
          /*routes: [
            GoRoute(
              path: SignUpRoute.routePath,
              name: SignUpRoute.routeName,
              pageBuilder: (context, state) {
                return const AppPage<void>(
                  key: ValueKey('sign-up'),
                  child: SignUpRoute(),
                );
              },
            ),
          ],*/
        ),
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider<LoginBloc>(
              create: (context) =>
                  LoginBloc(/*userRepository: context.read<UserRepository>()*/),
              child: child,
            );
          },
          routes: [],
          /*routes: [
            GoRoute(
              path: LoginRoute.routePath,
              name: LoginRoute.routeName,
              pageBuilder: (context, state) {
                final actionRequired =
                    state.uri.queryParameters[LoginRoute.queryParameter];
                return AppPage<void>(
                  key: const ValueKey('login'),
                  child: LoginRoute(
                    actionRequired: actionRequired,
                  ),
                );
              },
            ),
            ShellRoute(
              builder: (context, state, child) {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider<ForgotPasswordBloc>(
                      create: (context) => ForgotPasswordBloc(
                        userRepository: context.read<UserRepository>(),
                      ),
                    ),
                  ],
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: ForgotPasswordRoute.routePath,
                  name: ForgotPasswordRoute.routeName,
                  pageBuilder: (context, state) {
                    return const AppPage<void>(
                      key: ValueKey('forgot-password'),
                      child: ForgotPasswordRoute(),
                    );
                  },
                ),
                GoRoute(
                  path: ResetPasswordRoute.routePath,
                  name: ResetPasswordRoute.routeName,
                  pageBuilder: (context, state) {
                    return const AppPage<void>(
                      key: ValueKey('reset-password'),
                      child: ResetPasswordRoute(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        ShellRoute(
          routes: [
            GoRoute(
              path: HomeRoute.path,
              name: HomeRoute.name,
              pageBuilder: (context, state) => const NoTransitionPage<void>(
                key: ValueKey('home'),
                child: HomeRoute(),
              ),
            ),
          ],*/
        ),
      ],
    );
  }
}
