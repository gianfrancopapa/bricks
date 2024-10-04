import 'package:flutter/material.dart';
import 'package:temp/l10n/l10n.dart';

@visibleForTesting
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: l10n.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings_outlined),
          label: l10n.settings,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
