import 'package:flutter/material.dart';

class ForceUpgradeView extends StatelessWidget {
  const ForceUpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'The app is out of date. Please update to the latest version.',
        ),
      ),
    );
  }

  static void showAsDialog(BuildContext context) {
    showAdaptiveDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          title: const Text(' Update Required '),
          content: const Text(
            'The app is out of date. Please update to the latest version.',
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
