import 'package:flutter/material.dart';
import 'package:temp_ui/temp_ui.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SpacingPage());
  }

  @override
  Widget build(BuildContext context) {
    const spacingList = [
      _SpacingItem(spacing: UISpacing.xxxs, name: 'xxxs'),
      _SpacingItem(spacing: UISpacing.xxs, name: 'xxs'),
      _SpacingItem(spacing: UISpacing.xs, name: 'xs'),
      _SpacingItem(spacing: UISpacing.sm, name: 'sm'),
      _SpacingItem(spacing: UISpacing.md, name: 'md'),
      _SpacingItem(spacing: UISpacing.lg, name: 'lg'),
      _SpacingItem(spacing: UISpacing.xlg, name: 'xlg'),
      _SpacingItem(spacing: UISpacing.xxlg, name: 'xxlg'),
      _SpacingItem(spacing: UISpacing.xxxlg, name: 'xxxlg'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Spacing')),
      body: ListView.builder(
        itemCount: spacingList.length,
        itemBuilder: (_, index) => spacingList[index],
      ),
    );
  }
}

class _SpacingItem extends StatelessWidget {
  const _SpacingItem({required this.spacing, required this.name});

  final double spacing;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UISpacing.sm),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: UIColors.black,
                width: UISpacing.xxs,
                height: UISpacing.lg,
              ),
              Container(
                width: spacing,
                height: UISpacing.lg,
                color: UIColors.skyBlue,
              ),
              Container(
                color: UIColors.black,
                width: UISpacing.xxs,
                height: UISpacing.lg,
              ),
            ],
          ),
          const SizedBox(width: UISpacing.sm),
          Text(name),
        ],
      ),
    );
  }
}
