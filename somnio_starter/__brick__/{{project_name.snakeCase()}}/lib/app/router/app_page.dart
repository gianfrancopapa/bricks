import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppPage<T> extends Page<T> {
  const AppPage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    if (kIsWeb) {
      return PageRouteBuilder<T>(
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        settings: this,
        pageBuilder: (context, animation, secondaryAnimation) {
          return child;
        },
      );
    } else {
      return MaterialPageRoute<T>(
        settings: this,
        builder: (context) {
          return child;
        },
      );
    }
  }
}
