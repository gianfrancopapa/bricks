import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: "here goes the initial location",
      redirect: (context, state) {
        return null;
      },
      routes: [],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          child: Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Text(
                'Page not found',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}
