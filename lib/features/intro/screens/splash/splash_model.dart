import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/intro/screens/promo/promo_screen.dart';
import 'package:meditation_app_ui/utils/animated_switch_page.dart';

class SplashModel extends ElementaryModel {
  SplashModel(BuildContext context) {
    waitAndSwipe(context);
  }

  Future<void> waitAndSwipe(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    animatedSwitchPage(
      context,
      const PromoScreen(),
      routeAnimation: RouteAnimation.slideLeft,
    );
  }
}
