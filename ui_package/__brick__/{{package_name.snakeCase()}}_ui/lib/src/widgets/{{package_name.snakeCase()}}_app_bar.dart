import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';
import 'package:flutter/material.dart';

/// {@template app_app_bar}
/// A custom app bar widget.
class {{short_name.upperCase()}}AppBar extends StatelessWidget {
  /// {@macro app_app_bar}
  const {{short_name.upperCase()}}AppBar({
    super.key,
    this.widgetTitle,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.backgroundColor,
    this.elevation,
    this.centerTitle,
    this.toolbarHeight,
    this.leadingWidth,
    this.actions,
    this.buttonStyle,
    this.automaticallyImplyLeading,
  });

  /// The AppBar if the user wants to add actions.
  {{short_name.upperCase()}}AppBar.actionAppBar({
    super.key,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.backgroundColor,
    this.centerTitle,
    this.leadingWidth,
    this.buttonStyle,
  })  : toolbarHeight = 50,
        actions = <Widget>[
          TextButton(
            style: buttonStyle,
            onPressed: () {},
            child: const Text('Action 1'),
          ),
        ],
        elevation = 3,
        widgetTitle = Text(textTitle!),
        automaticallyImplyLeading = false;

  /// Red color AppBar.
  {{short_name.upperCase()}}AppBar.redAppBar({
    super.key,
    this.textTitle,
    this.titleTextStyle,
    this.leading,
    this.actions,
    this.buttonStyle,
    this.backgroundColor = {{short_name.upperCase()}}Colors.red,
    this.automaticallyImplyLeading,
  })  : elevation = 5,
        widgetTitle = Text(textTitle!),
        centerTitle = true,
        toolbarHeight = 50,
        leadingWidth = 60;

  /// The text for the title of the app bar is a Text.
  final String? textTitle;

  /// The title of the app bar.
  final Widget? widgetTitle;

  /// The style of the title text.
  final TextStyle? titleTextStyle;

  /// The leading widget of the app bar.
  final Widget? leading;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The elevation of the app bar.
  final double? elevation;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// The height of the app bar.
  final double? toolbarHeight;

  /// The width of the leading widget.
  final double? leadingWidth;

  /// The actions of the app bar.
  final List<Widget>? actions;

  /// The style of the button of actions from the appbar.
  final ButtonStyle? buttonStyle;

  /// Whether the leading widget should be automatically implied if set to false
  /// the automatic leading widget will not be shown.
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widgetTitle,
      titleTextStyle:
          titleTextStyle ?? Theme.of(context).appBarTheme.titleTextStyle,
      leading: leading,
      backgroundColor:
          backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    );
  }
}
