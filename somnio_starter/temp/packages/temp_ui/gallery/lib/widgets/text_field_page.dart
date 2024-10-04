import 'package:flutter/material.dart';
import 'package:temp_ui/temp_ui.dart';

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
        padding: const EdgeInsets.all(TEMPSpacing.lg),
        child: Column(
          children: [
            TEMPTextField.emailTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: TEMPSpacing.sm),
            TEMPTextField.passwordTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: TEMPSpacing.sm),
            TEMPTextField(
              hintText: 'Default text field',
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
