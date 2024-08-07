import 'package:flutter/material.dart';
import 'package:{{project_name}}/l10n/l10n.dart';

class ForceUpgradeView extends StatelessWidget {
  const ForceUpgradeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Center(
        child: Text(
          l10n.forceUpgradeMessage,
        ),
      ),
    );
  }

  static void showAsDialog(BuildContext context) {
    showAdaptiveDialog<void>(
      context: context,
      builder: (context) {
        final l10n = context.l10n;
        return AlertDialog.adaptive(
          title: Text(l10n.updateRequired),
          content: Text(
            l10n.forceUpgradeMessage,
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(l10n.ok),
            ),
          ],
        );
      },
    );
  }
}
