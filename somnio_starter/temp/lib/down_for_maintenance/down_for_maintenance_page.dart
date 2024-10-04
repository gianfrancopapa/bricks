import 'package:temp/down_for_maintenance/down_for_maintenance.dart';
import 'package:flutter/material.dart';

class DownForMaintenancePage extends Page<void> {
  const DownForMaintenancePage({super.key});
  static const path = '/down-for-maintenance';
  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return const DownForMaintenanceView();
      },
    );
  }
}
