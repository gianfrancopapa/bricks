import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DownForMaintenanceView extends StatelessWidget {
  const DownForMaintenanceView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Down for maintenance'),
      ),
    );
  }

  static void showAsDialog(BuildContext context) {
    showAdaptiveDialog<void>(
      context: context,
      builder: (context) {
        return const AlertDialog.adaptive(
          title: Text('Down for maintenance'),
          content: Text(
            'The app is currently down for maintenance. Please try again later.',
          ),
          actions: [
            TextButton(
              onPressed: SystemNavigator.pop,
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
