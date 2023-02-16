import 'package:flutter/material.dart';
import 'package:gallery/widgets/widgets.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const WidgetsPage());
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <_ListItem>[
      _ListItem(
        icon: const Icon(Icons.vignette),
        title: const Text('App Buttons'),
        onTap: () => Navigator.of(context).push<void>(ButtonPage.route()),
      ),
      _ListItem(
        icon: const Icon(Icons.email_outlined),
        title: const Text('Text Fields'),
        onTap: () => Navigator.of(context).push<void>(TextFieldPage.route()),
      ),
      _ListItem(
        icon: const Icon(Icons.drag_indicator_outlined),
        title: const Text('Icons'),
        onTap: () => Navigator.of(context).push<void>(IconsPage.route()),
      ),
      _ListItem(
        icon: const Icon(Icons.drag_indicator_outlined),
        title: const Text('Appbar'),
        onTap: () => Navigator.of(context).push<void>(AppBarPage.route()),
      ),
    ];

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: ListView.separated(
        itemCount: widgets.length,
        itemBuilder: (_, index) => widgets[index],
        separatorBuilder: (_, __) => Divider(
          color: theme.dividerColor,
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    this.onTap,
    required this.icon,
    required this.title,
  });

  final VoidCallback? onTap;
  final Widget icon;
  final Text title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: IconTheme(
        data: IconThemeData(
          color: theme.iconTheme.color,
        ),
        child: icon,
      ),
      title: title,
      trailing: Icon(
        Icons.chevron_right,
        color: theme.colorScheme.onBackground,
      ),
      onTap: onTap,
      iconColor: theme.iconTheme.color,
    );
  }
}
