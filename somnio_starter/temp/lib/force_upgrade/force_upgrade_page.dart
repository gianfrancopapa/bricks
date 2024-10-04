import 'package:flutter/material.dart';
import 'package:temp/force_upgrade/force_upgrade.dart';

class ForceUpgradePage extends Page<void> {
  const ForceUpgradePage({super.key});
  static const path = '/force-upgrade';
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return const ForceUpgradeView();
      },
    );
  }
}
