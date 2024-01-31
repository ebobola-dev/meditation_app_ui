import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_ui/assets/colors/ext_colors.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';

class VerifyMethodCard extends StatelessWidget {
  final VerifyMethods method;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;
  final VoidCallback onTap;
  final bool selected;
  const VerifyMethodCard({
    super.key,
    required this.method,
    required this.titleStyle,
    required this.bodyStyle,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final otherColors = Theme.of(context).extension<OtherExtColors>()!;
    final tokenColors = Theme.of(context).extension<TokenExtColors>()!;
    final inputColors = Theme.of(context).extension<InputExtColors>()!;
    final Color backgroundColor;
    final Color borderColor;
    final Color iconColor;
    if (selected) {
      backgroundColor = otherColors.whiteToPrimary;
      borderColor = tokenColors.primaryBase;
      iconColor = tokenColors.primaryBase;
    } else {
      backgroundColor = otherColors.whiteToSecondary;
      borderColor = tokenColors.stroke;
      iconColor = inputColors.icon;
    }

    return Ink(
      height: 72.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FAFC),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  method.icon,
                  colorFilter: ColorFilter.mode(
                    iconColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.title,
                    style: titleStyle,
                  ),
                  Text(
                    method.subtitle,
                    style: bodyStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
