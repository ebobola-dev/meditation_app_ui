import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/ext_colors.dart';
import 'package:meditation_app_ui/assets/colors/theme_colors.dart';

class ElButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool alternativeBackground;
  const ElButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.alternativeBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor;
    if (alternativeBackground) {
      backgroundColor =
          Theme.of(context).extension<OtherExtColors>()!.whiteToSecondary;
    } else {
      backgroundColor = null;
    }

    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: onPressed == null
            ? Theme.of(context).extension<InputExtColors>()!.label
            : backgroundColor,
        gradient: alternativeBackground
            ? null
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ThemeColors.buttonColor1,
                  ThemeColors.buttonColor2,
                ],
              ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
