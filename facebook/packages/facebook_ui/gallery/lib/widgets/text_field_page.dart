import 'package:facebook_ui/facebook_ui.dart';
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
        padding: const EdgeInsets.all(UISpacing.lg),
        child: Column(
          children: [
            UITextField.emailTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: UISpacing.sm),
            UITextField.passwordTextField(
              onChanged: (_) {},
            ),
            const SizedBox(height: UISpacing.sm),
            UITextField(
              hintText: 'Default text field',
              onChanged: (_) {},
            ),
          ],
        ),
      ),
    );
  }
}
