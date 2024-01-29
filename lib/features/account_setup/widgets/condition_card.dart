import 'package:flutter/material.dart';

class ConditionCard extends StatelessWidget {
  final Widget description;
  final bool isAgree;
  final void Function(bool?) onToggle;
  const ConditionCard({
    super.key,
    required this.description,
    required this.isAgree,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
