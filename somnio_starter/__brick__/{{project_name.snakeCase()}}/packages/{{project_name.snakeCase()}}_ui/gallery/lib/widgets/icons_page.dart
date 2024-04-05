import 'package:{{project_name.snakeCase()}}_ui/{{project_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const IconsPage());
  }

  @override
  State<IconsPage> createState() => _IconsPage();
}

class _IconsPage extends State<IconsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const contentSpacing = {{short_name.upperCase()}}Spacing.sm;
    final appIconsList = [
      const SizedBox(height: contentSpacing),
      theme.icons.emailOutline(
        size: 30,
      ),
      const SizedBox(height: contentSpacing),
      theme.icons.backIcon(
        size: 30,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('App Assets')),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: appIconsList.map((icon) {
              return icon;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
