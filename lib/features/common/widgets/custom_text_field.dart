import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Widget? additionalSuffixWidget;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.additionalSuffixWidget,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.maxLength,
    this.textInputAction,
    this.onSubmitted,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium!,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (additionalSuffixWidget != null) additionalSuffixWidget!,
            const SizedBox(width: 6.0),
          ],
        ),
      ),
    );
  }
}

class SuffixIconButton extends StatelessWidget {
  final Widget icon;
  final bool show;
  final VoidCallback? onTap;
  const SuffixIconButton({
    super.key,
    this.onTap,
    this.show = true,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: show
          ? GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 6.0,
                ),
                child: icon,
              ),
            )
          : const SizedBox(),
    );
  }
}
