import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ButtonPage());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const contentSpacing = {{short_name.upperCase()}}Spacing.sm;
    final appButtonList = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Icon button'),
          IconButton(
            onPressed: () {},
            color: theme.colorScheme.primary,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      const SizedBox(height: contentSpacing),
      OutlinedButton(
        onPressed: () {},
        style: theme.outlinedButtonTheme.style,
        child: Text(
          'Secondary button',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      const SizedBox(height: contentSpacing),
      OutlinedButton(
        onPressed: () {},
        style: theme.outlinedButtonTheme.style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            theme.icons.emailOutline(
              color: {{short_name.upperCase()}}Colors.blue,
            ),
            const SizedBox(width: contentSpacing),
            const Text('Primary button + logo'),
          ],
        ),
      ),
      const SizedBox(height: contentSpacing),
      TextButton(
        style: Theme.of(context).textButtonTheme.style,
        onPressed: () {},
        child: const Text(
          'Text button',
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: contentSpacing),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Floating action button'),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: theme.colorScheme.background,
            child: theme.icons.emailOutline(size: 20),
          ),
        ],
      ),
      const SizedBox(height: contentSpacing),
      Chip(
        backgroundColor: theme.chipTheme.backgroundColor,
        padding: EdgeInsets.zero,
        label: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: {{short_name.upperCase()}}Spacing.xxs,
            horizontal: {{short_name.upperCase()}}Spacing.xs,
          ),
          child: Text(
            'Common chip',
          ),
        ),
      ),
      const SizedBox(height: contentSpacing),
      ChoiceChip(
        avatar: theme.icons.emailOutline(
          color: {{short_name.upperCase()}}Colors.black,
        ),
        padding: const EdgeInsets.all(8),
        label: Text(
          'Icon chip',
          style: theme.chipTheme.labelStyle,
        ),
        selected: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('App Buttons & Chips')),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: appButtonList.map((button) {
              return button;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
