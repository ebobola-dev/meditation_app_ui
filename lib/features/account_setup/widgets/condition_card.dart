import 'package:flutter/material.dart';
import 'package:meditation_app_ui/utils/animations.dart';

class ConditionCard extends StatelessWidget {
  final GlobalKey<ShakingAnimationState>? animationKey;
  final Widget description;
  final bool isAgree;
  final bool required_;
  final void Function(bool?) onToggle;
  const ConditionCard({
    super.key,
    this.animationKey,
    required this.description,
    required this.isAgree,
    required this.onToggle,
    this.required_ = false,
  });

  @override
  Widget build(BuildContext context) {
    return ShakingAnimation(
      key: animationKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24.0,
            height: 24.0,
            child: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: isAgree,
                onChanged: onToggle,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Flexible(child: description),
        ],
      ),
    );
  }
}
