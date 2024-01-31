import 'package:flutter/material.dart';

//? Дрожание
class ShakingAnimation extends StatefulWidget {
  final Widget child;
  const ShakingAnimation({
    super.key,
    required this.child,
  });

  @override
  State<ShakingAnimation> createState() => ShakingAnimationState();
}

class ShakingAnimationState extends State<ShakingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _animation = Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(
          -0.3,
          0.0,
        )).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticIn,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void shake() async {
    await _animationController.forward();
    _animationController.animateBack(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
