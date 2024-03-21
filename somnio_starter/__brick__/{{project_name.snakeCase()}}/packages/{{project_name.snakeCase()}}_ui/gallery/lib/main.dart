import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';
import 'package:gallery/colors/colors.dart';
import 'package:gallery/spacing/spacing.dart';
import 'package:gallery/typography/typography.dart';
import 'package:gallery/widgets/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example Gallery',
      theme: _isDark ? {{short_name.upperCase()}}Theme().darkTheme : {{short_name.upperCase()}}Theme().lightTheme,
      home: RootPage(toggleTheme: _toggleTheme),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.toggleTheme});

  final VoidCallback toggleTheme;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _ListItem(
        icon: const Icon(Icons.color_lens),
        title: const Text('Colors'),
        subtitle: const Text('Some predefined colors'),
        onTap: () => Navigator.of(context).push<void>(ColorsPage.route()),
      ),
      _ListItem(
        icon: const Icon(Icons.text_format),
        title: const Text('Typography'),
        subtitle: const Text('Some predefined text styles'),
        onTap: () => Navigator.of(context).push<void>(TypographyPage.route()),
      ),
      _ListItem(
        icon: const Icon(Icons.border_vertical),
        title: const Text('Spacing'),
        subtitle: const Text('All of the predefined spacings'),
        onTap: () => Navigator.of(context).push<void>(SpacingPage.route()),
      ),
      _ListItem(
        icon: const Icon(Icons.widgets),
        title: const Text('Widgets'),
        subtitle: const Text('Some predefined custom widgets'),
        onTap: () => Navigator.of(context).push<void>(WidgetsPage.route()),
      ),
    ];
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Example Theme Gallery'.toUpperCase(),
        ),
        titleTextStyle: theme.appBarTheme.titleTextStyle,
        leading: IconButton(
          onPressed: toggleTheme,
          icon: Icon(
            theme.brightness == Brightness.dark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: pages.length,
        itemBuilder: (_, index) => pages[index],
        separatorBuilder: (_, __) => Divider(
          color: theme.dividerColor,
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.onTap,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final VoidCallback onTap;
  final Icon icon;
  final Text title;
  final Text subtitle;

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
      subtitle: subtitle,
      trailing: const Icon(Icons.arrow_forward),
      onTap: onTap,
      iconColor: theme.colorScheme.onBackground,
    );
  }
}
