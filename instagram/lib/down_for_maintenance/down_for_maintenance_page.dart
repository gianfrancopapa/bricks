import 'package:flutter/material.dart';
import 'package:instagram/down_for_maintenance/down_for_maintenance.dart';

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
