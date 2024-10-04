import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:temp/app/app.dart';
import 'package:temp/authentication/delete_account/delete_account.dart';
import 'package:temp/l10n/l10n.dart';
import 'package:temp/settings/settings.dart';
import 'package:temp_ui/temp_ui.dart';

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
          key: const Key('SettingsAppBar'),
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
          key: const Key('ContactUsSettingsItem'),
          title: l10n.contactUs,
          onTap: () {},
        ),
        _SettingsItem(
          key: const Key('TermsAndConditionsSettingsItem'),
          title: l10n.termsAndConditions,
          onTap: () {},
        ),
        _SettingsItem(
          key: const Key('AboutUsSettingsItem'),
          title: l10n.aboutUs,
          onTap: () {},
        ),
        _SettingsItem(
          key: const Key('LogoutSettingsItem'),
          title: l10n.logOut,
          onTap: () {
            context.read<AppBloc>().add(const AppLogoutRequested());
            Navigator.of(context).pop();
          },
        ),
        _SettingsItem(
          key: const Key('DeleteAccountSettingsItem'),
          title: l10n.deleteAccount,
          onTap: () {
            context.push(DeleteAccountPage.path);
          },
        ),
        Padding(
          key: const Key('AppVersionSettingsItem'),
          padding: const EdgeInsets.all(TEMPSpacing.xlg),
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
    super.key,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TEMPSpacing.xxxlg,
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
