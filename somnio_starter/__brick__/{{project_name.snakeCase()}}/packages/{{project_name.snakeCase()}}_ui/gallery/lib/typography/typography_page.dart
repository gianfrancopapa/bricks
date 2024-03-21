import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TypographyPage());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final uiTextStyleList = [
      _TextItem(name: 'Display Large', style: theme.textTheme.displayLarge!),
      _TextItem(name: 'Display Medium', style: theme.textTheme.displayMedium!),
      _TextItem(name: 'Display Small', style: theme.textTheme.displaySmall!),
      _TextItem(
        name: 'Headline Medium',
        style: theme.textTheme.headlineMedium!,
      ),
      _TextItem(name: 'Headline Small', style: theme.textTheme.headlineSmall!),
      _TextItem(name: 'Title large', style: theme.textTheme.titleLarge!),
      _TextItem(name: 'Title medium', style: theme.textTheme.titleMedium!),
      _TextItem(name: 'Title small', style: theme.textTheme.titleSmall!),
      _TextItem(name: 'Body large', style: theme.textTheme.bodyLarge!),
      _TextItem(name: 'Body medium', style: theme.textTheme.bodyMedium!),
      _TextItem(name: 'Body small', style: theme.textTheme.bodySmall!),
      _TextItem(name: 'Label large', style: theme.textTheme.labelLarge!),
      _TextItem(name: 'Label Small', style: theme.textTheme.labelSmall!),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Typography')),
      body: ListView(
        children: [
          const Center(child: Text('UI Typography Text styles')),
          const SizedBox(height: 16),
          ...uiTextStyleList,
        ],
      ),
    );
  }
}

class _TextItem extends StatelessWidget {
  const _TextItem({required this.name, required this.style});

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: {{short_name.upperCase()}}Spacing.sm,
        vertical: {{short_name.upperCase()}}Spacing.lg,
      ),
      child: Text(name, style: style),
    );
  }
}
