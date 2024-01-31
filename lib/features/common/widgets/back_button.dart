import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';

class MyBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MyBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () => Navigator.pop(context),
      icon: SvgPicture.asset(
        IconPaths.arrowLeft,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
