import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/authentication/delete_account/view/delete_account_page.dart';
import 'package:{{project_name}}/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Text('Delete Account'),
            onPressed: () {
              context.push(DeleteAccountPage.path);
            },
          ),
          IconButton(
            icon: Text(l10n.logOut),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  final l10n = context.l10n;

  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(l10n.logOutConfirmation),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
              Navigator.of(context).pop();
            },
            child: Text(l10n.logOut),
          ),
        ],
      );
    },
  );
}
