import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name}}/authentication/delete_account/view/delete_account_page.dart';
import 'package:{{project_name}}/home/home.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomeBloc bloc) => bloc.state.status);
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        key: Keys.homeDeleteAccountButton,
        title: Text(l10n.home),
        actions: [
          IconButton(
            key: Keys.homeDeleteAccountButton,
            icon: Text(l10n.deleteAccount),
            onPressed: () {
              context.push(DeleteAccountPage.path);
            },
          ),
          IconButton(
            key: Keys.homeLogoutButton,
            icon: Text(l10n.logOut),
            onPressed: () {
              showLogoutConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: status.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Placeholder(),
    );
  }
}

@visibleForTesting
void showLogoutConfirmationDialog(BuildContext context) {
  final l10n = context.l10n;

  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(l10n.logOutConfirmation),
        actions: [
          TextButton(
            key: Keys.cancelButton,
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
