import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';


/// {@template outlined_button}
/// A button component based on material [OutlinedButton] widget
/// {@endtemplate}
class {{short_name.upperCase()}}OutlinedButton extends StatelessWidget {
  /// {@macro ui_outlined_button}
  const {{short_name.upperCase()}}OutlinedButton({
    required this.text,
    super.key,
    this.backgroundColor,
    this.darkBackgroundColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.icon,
  });
  
  /// Primary button which background color is the primary color of the theme
  const {{short_name.upperCase()}}OutlinedButton.primary({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
  })  : backgroundColor = {{short_name.upperCase()}}Colors.lightBlue200,
        darkBackgroundColor = {{short_name.upperCase()}}Colors.blue,
        borderColor = {{short_name.upperCase()}}Colors.white,
        textColor = {{short_name.upperCase()}}Colors.black;

  /// Secondary button which background color
  /// is the secondary color of the theme
  const {{short_name.upperCase()}}OutlinedButton.secondary({
    required this.text,
    super.key,
    this.onPressed,
    this.icon,
  })  : backgroundColor = {{short_name.upperCase()}}Colors.grey,
        darkBackgroundColor = {{short_name.upperCase()}}Colors.grey,
        borderColor = {{short_name.upperCase()}}Colors.white,
        textColor = {{short_name.upperCase()}}Colors.white;

  /// Text on the button
  final String text;

  /// Callback when the button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Background color of the button in dark mode
  final Color? darkBackgroundColor;

  /// Text color of the button
  final Color? textColor;

  /// Border color of the button
  final Color? borderColor;

  /// Icon on the button
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final isInactive = onPressed == null;
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        disabledBackgroundColor: theme.colorScheme.background,
        backgroundColor: backgroundColor,
        side: borderColor == null
            ? null
            : BorderSide(
                color: onPressed == null
                    ? (theme.colorScheme.onBackground)
                    : borderColor!,
              ),
        padding: const EdgeInsets.symmetric(
          horizontal: {{short_name.upperCase()}}Spacing.md,
          vertical: {{short_name.upperCase()}}Spacing.md,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: icon,
            ),
          SizedBox(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: {{short_name.upperCase()}}TextStyle.button.copyWith(
                color:
                    isInactive ? (theme.colorScheme.onBackground) : textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
