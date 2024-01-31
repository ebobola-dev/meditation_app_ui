import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_ui/assets/colors/ext_colors.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';

class PasswordEyeButton extends StatelessWidget {
  final bool close;
  final VoidCallback onTap;
  const PasswordEyeButton({
    super.key,
    required this.close,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<InputExtColors>()!.icon;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          splashColor: Colors.transparent,
          onPressed: onTap,
          icon: SvgPicture.asset(
            IconPaths.eye,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
        ),
        Transform.rotate(
          angle: 0.75,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: close ? 0.0 : 32.0,
            height: 2,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ],
    );
  }
}
