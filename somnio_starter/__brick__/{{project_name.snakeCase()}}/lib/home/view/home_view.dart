import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/authentication/delete_account/view/delete_account_page.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Text('Delete Account'),
            onPressed: () {
              context.push(DeleteAccountPage.path);
            },
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
