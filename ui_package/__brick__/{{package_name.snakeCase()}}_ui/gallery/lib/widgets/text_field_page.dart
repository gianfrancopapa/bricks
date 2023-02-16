import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TextFieldPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Text Field',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all({{short_name.upperCase()}}Spacing.lg),
        child: Column(
          children: [
            {{short_name.upperCase()}}TextField.emailTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: {{short_name.upperCase()}}Spacing.sm),
            {{short_name.upperCase()}}TextField.passwordTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: {{short_name.upperCase()}}Spacing.sm),
            {{short_name.upperCase()}}TextField(
              hintText: 'Default text field',
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
