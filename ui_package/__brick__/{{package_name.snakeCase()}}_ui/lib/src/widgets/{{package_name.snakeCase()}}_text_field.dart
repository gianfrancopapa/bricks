import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{package_name.snakeCase()}}_ui/{{package_name.snakeCase()}}_ui.dart';

/// {@template text_field}
/// A text field component based on material [TextFormField] widget which
/// extends TextField with email icon and validates input type.
/// {@endtemplate}
class {{short_name.upperCase()}}TextField extends StatelessWidget {
    /// {@macro text_field}
    const {{short_name.upperCase()}}TextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
  });

  /// A text field component based on material [TextFormField] widget which
  /// extends TextField with email icon and validates input type.
   const {{short_name.upperCase()}}TextField.emailTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
  })  : keyboardType = TextInputType.emailAddress,
        autoFillHints = const [AutofillHints.email],
        prefix = const Padding(
          padding: EdgeInsets.only(
            left: {{short_name.upperCase()}}Spacing.sm,
            right: {{short_name.upperCase()}}Spacing.sm,
          ),
          child: Icon(
            Icons.email,
            color: {{short_name.upperCase()}}Colors.grey,
          ),
        ),
        autocorrect = false;

    /// A password text field component based on material [TextFormField] 
    /// widget which extends TextField which obscures the text
   const {{short_name.upperCase()}}TextField.passwordTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.readOnly = false,
    this.errorText,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.autoFillHints,
    this.prefix,
  })  : hintText = 'Password',
        obscureText = true,
        autocorrect = false;

 /// A value to initialize the field to.
  final String? initialValue;

  /// List of auto fill hints.
  final Iterable<String>? autoFillHints;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// Optional input validation and formatting overrides.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether to enable autocorrect.
  /// Defaults to true.
  final bool autocorrect;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool readOnly;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that appears below the field.
  final String? errorText;

  /// A widget that appears before the editable part of the text field.
  final Widget? prefix;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// The type of keyboard to use for editing the text.
  /// Defaults to [TextInputType.text] if maxLines is one and
  /// [TextInputType.multiline] otherwise.
  final TextInputType? keyboardType;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  final ValueChanged<String>? onSubmitted;

  /// Called when the text field has been tapped.
  final VoidCallback? onTap;

  /// Whether the text field should obscure the text being edited.
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 80),
      child: TextFormField(
        key: key,
        initialValue: initialValue,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        autocorrect: autocorrect,
        readOnly: readOnly,
        autofillHints: autoFillHints,
        cursorColor: Theme.of(context).colorScheme.onBackground,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelLarge,
          errorText: errorText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          suffixIconConstraints: const BoxConstraints.tightFor(
            width: 32,
            height: 32,
          ),
          prefixIconConstraints: const BoxConstraints.tightFor(
            width: 48,
          ),
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}

