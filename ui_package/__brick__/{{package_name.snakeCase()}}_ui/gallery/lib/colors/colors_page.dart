import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ColorsPage());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorItems = <Widget>[
      _ColorTextContainer(
        color: theme.colorScheme.primary,
        name: 'Primary ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onPrimary,
        name: 'On primary ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.primaryContainer,
        name: 'primary Container',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onPrimaryContainer,
        name: 'on primary container',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.secondary,
        name: 'Secondary ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onSecondary,
        name: 'On Secondary ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.secondaryContainer,
        name: 'Secondary container',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onSecondaryContainer,
        name: 'On secondary container',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.tertiary,
        name: 'Tertiary ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onTertiary,
        name: 'On tertiary ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.tertiaryContainer,
        name: 'Tertiary container ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onTertiaryContainer,
        name: 'On tertiary container ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.error,
        name: 'Error ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onError,
        name: 'On error ',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.errorContainer,
        name: 'Error container',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onErrorContainer,
        name: 'on error container',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.background,
        name: 'Background',
        textColor: theme.colorScheme.onBackground,
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onBackground,
        name: 'On background',
        textColor: theme.colorScheme.background,
      ),
      _ColorTextContainer(
        color: theme.colorScheme.surface,
        name: 'Surface',
        textColor: theme.colorScheme.onSurface,
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onSurface,
        name: 'On surface',
        textColor: theme.colorScheme.background,
      ),
      _ColorTextContainer(
        color: theme.colorScheme.surfaceVariant,
        name: 'Sureface Variant',
        textColor: {{short_name.upperCase()}}Colors.black,
      ),
      _ColorTextContainer(
        color: theme.colorScheme.onSurfaceVariant,
        name: 'On Sureface Variant',
      ),
      _ColorTextContainer(
        color: theme.colorScheme.inversePrimary,
        name: 'Inverse primary',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ColorTheme based on Material Flutter'.toUpperCase(),
        ),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: colorItems.map((colorContainer) {
            return colorContainer;
          }).toList(),
        ),
      ),
    );
  }
}

class _ColorTextContainer extends StatelessWidget {
  const _ColorTextContainer({
    required this.color,
    required this.name,
    this.textColor,
  });

  final Color color;
  final Color? textColor;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(
        10,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: {{short_name.upperCase()}}Spacing.lg * 2,
        vertical: {{short_name.upperCase()}}Spacing.xs,
      ),
      width: {{short_name.upperCase()}}Spacing.spaceUnit * 100,
      height: {{short_name.upperCase()}}Spacing.xxlg,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: theme.colorScheme.onBackground,
        ), // Set border width
        borderRadius: const BorderRadius.all(
          Radius.circular({{short_name.upperCase()}}Spacing.xxs * 5),
        ),
      ),
      child: Center(
        child: Text(
          name.toUpperCase(),
          maxLines: 2,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: textColor ?? {{short_name.upperCase()}}Colors.black,
          ),
        ),
      ),
    );
  }
}
