import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temp/home/home.dart';
import 'package:temp/settings/view/view.dart';

class NavigationBarRouter extends ShellRoute {
  NavigationBarRouter()
      : super(
          pageBuilder: (context, state, child) {
            int? index;
            if (state.fullPath == HomePage.path) {
              index = 0;
            } else if (state.fullPath == SettingsPage.path) {
              index = 1;
            }

            return MainScreenPageBuilder.route(child, index);
          },
          routes: [
            GoRoute(
              path: HomePage.path,
              pageBuilder: (context, state) {
                return const HomePage();
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
