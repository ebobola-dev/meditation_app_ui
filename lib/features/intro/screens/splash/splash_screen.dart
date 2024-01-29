import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:meditation_app_ui/assets/colors/primary_colors.dart';
import 'package:meditation_app_ui/features/intro/screens/splash/splash_widget_model.dart';

class SplashScreen extends ElementaryWidget<SplashWM> {
  const SplashScreen({
    super.key,
    WidgetModelFactory wmFactory = createSplashWM,
  }) : super(wmFactory);

  @override
  Widget build(ISplashWM wm) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      wm.logoImagePath,
                      width: wm.logoSize.width,
                      height: wm.logoSize.height,
                    ),
                    const SizedBox(height: 33.0),
                    Text(
                      'clarity'.toUpperCase(),
                      style: wm.textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 63.0,
                  height: 63.0,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballSpinFadeLoader,
                    colors: [PrimaryColors.c100, PrimaryColors.base_],
                    strokeWidth: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
