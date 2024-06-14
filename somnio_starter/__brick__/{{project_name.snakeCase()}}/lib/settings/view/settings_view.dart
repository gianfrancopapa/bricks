import 'package:flutter/material.dart';
import 'package:{{project_name}}/app/app.dart';
import 'package:{{project_name}}/authentication/delete_account/delete_account.dart';
import 'package:{{project_name}}/l10n/l10n.dart';
import 'package:{{project_name}}/settings/settings.dart';
import 'package:{{project_name}}_ui/{{project_name}}_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state.status == SettingsStatus.error) {
          // Handle Error
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.settings),
        ),
        body: const _SettingsForm(),
      ),
    );
  }
}

class _SettingsForm extends StatelessWidget {
  const _SettingsForm();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status = context.select((SettingsBloc bloc) => bloc.state.status);
    final appVersion =
        context.select((SettingsBloc bloc) => bloc.state.appVersion);

    if (status == SettingsStatus.loading) {
      return const CircularProgressIndicator();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SettingsItem(
          title: l10n.contactUs,
          onTap: () {},
        ),
        _SettingsItem(
          title: l10n.termsAndConditions,
          onTap: () {},
        ),
        _SettingsItem(
          title: l10n.aboutUs,
          onTap: () {},
        ),
        _SettingsItem(
          title: l10n.logOut,
          onTap: () {
            context.read<AppBloc>().add(const AppLogoutRequested());
            Navigator.of(context).pop();
          },
        ),
        _SettingsItem(
          title: l10n.deleteAccount,
          onTap: () {
            context.push(DeleteAccountPage.path);
          },
        ),
        Padding(
          padding: const EdgeInsets.all({{short_name.upperCase()}}Spacing.xlg),
          child: Text('${l10n.version} $appVersion'),
        ),
      ],
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: {{short_name.upperCase()}}Spacing.xxxlg,
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
