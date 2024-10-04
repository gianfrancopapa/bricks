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
      _SpacingItem(spacing: TEMPSpacing.xxxs, name: 'xxxs'),
      _SpacingItem(spacing: TEMPSpacing.xxs, name: 'xxs'),
      _SpacingItem(spacing: TEMPSpacing.xs, name: 'xs'),
      _SpacingItem(spacing: TEMPSpacing.sm, name: 'sm'),
      _SpacingItem(spacing: TEMPSpacing.md, name: 'md'),
      _SpacingItem(spacing: TEMPSpacing.lg, name: 'lg'),
      _SpacingItem(spacing: TEMPSpacing.xlg, name: 'xlg'),
      _SpacingItem(spacing: TEMPSpacing.xxlg, name: 'xxlg'),
      _SpacingItem(spacing: TEMPSpacing.xxxlg, name: 'xxxlg'),
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
      padding: const EdgeInsets.all(TEMPSpacing.sm),
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                color: TEMPColors.black,
                width: TEMPSpacing.xxs,
                height: TEMPSpacing.lg,
              ),
              Container(
                width: spacing,
                height: TEMPSpacing.lg,
                color: TEMPColors.skyBlue,
              ),
              Container(
                color: TEMPColors.black,
                width: TEMPSpacing.xxs,
                height: TEMPSpacing.lg,
              ),
            ],
          ),
          const SizedBox(width: TEMPSpacing.sm),
          Text(name),
        ],
      ),
    );
  }
}
