import 'package:flutter/material.dart';

class TabSelectorItem extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  const TabSelectorItem({
    super.key,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 24.0 : 9.0,
      height: 9.0,
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.5),
        color: isActive ? activeColor : inactiveColor,
      ),
    );
  }
}
