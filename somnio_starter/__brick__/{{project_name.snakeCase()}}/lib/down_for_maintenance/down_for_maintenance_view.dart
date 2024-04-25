import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name}}/l10n/l10n.dart';

class DownForMaintenanceView extends StatelessWidget {
  const DownForMaintenanceView({super.key});
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Text(l10n.downForMaintenanceMessage),
      ),
    );
  }

  static void showAsDialog(BuildContext context) {
    showAdaptiveDialog<void>(
      context: context,
      builder: (context) {
        final l10n = context.l10n;
        return AlertDialog.adaptive(
          title: Text(l10n.downForMaintenance),
          content: Text(
            l10n.downForMaintenanceMessage,
          ),
          actions: [
            TextButton(
              onPressed: SystemNavigator.pop,
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
  }
}
