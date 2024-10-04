import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temp/navigation/navigation.dart';
import 'package:temp/home/home.dart';
import 'package:temp/settings/settings.dart';

class MainScreenPageBuilder extends StatelessWidget {
  const MainScreenPageBuilder({
    required this.child,
    this.currentIndex,
    super.key,
  });

  static NoTransitionPage<void> route(Widget child, int? currentIndex) =>
      NoTransitionPage<void>(
        child: BlocProvider(
          create: (context) => HomeBloc(),
          child: MainScreenPageBuilder(
            currentIndex: currentIndex,
            child: child,
          ),
        ),
      );

  final Widget child;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select((HomeBloc bloc) => bloc.state.tabIndex);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedTab,
        onTap: (index) {
          context.read<HomeBloc>().add(HomeTabChanged(index));
          if (index == 0) {
            context.go(HomePage.path);
          }
          if (index == 1) {
            context.go(SettingsPage.path);
          }
        },
      ),
    );
  }
}
