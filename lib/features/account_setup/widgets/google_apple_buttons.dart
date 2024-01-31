import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';

class GoogleAppleButtons extends StatelessWidget {
  final VoidCallback onAppleButtonTap;
  final VoidCallback onGoogleButtonTap;
  const GoogleAppleButtons({
    super.key,
    required this.onAppleButtonTap,
    required this.onGoogleButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElButton(
          onPressed: onAppleButtonTap,
          alternativeBackground: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: SvgPicture.asset(
                  IconPaths.apple,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Continue with Apple',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12.0),
        ElButton(
          onPressed: onGoogleButtonTap,
          alternativeBackground: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(IconPaths.google),
              const SizedBox(width: 8),
              const Text(
                'Continue with Google',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
