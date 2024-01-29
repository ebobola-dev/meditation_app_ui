import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';
import 'package:meditation_app_ui/features/intro/screens/splash/splash_model.dart';
import 'package:meditation_app_ui/features/intro/screens/splash/splash_screen.dart';

SplashWM createSplashWM(BuildContext context) => SplashWM(SplashModel(context));

class SplashWM extends WidgetModel<SplashScreen, SplashModel>
    implements ISplashWM {
  SplashWM(super.model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  Size get screenSize => MediaQuery.of(context).size;

  @override
  Size get logoSize => Size(screenSize.width * .5, screenSize.width * .5);

  @override
  TextStyle get textStyle => Theme.of(context).textTheme.titleLarge!.copyWith(
        fontSize: 30.0,
      );

  @override
  String get logoImagePath => ImagePaths.introPreviewLogo;
}

abstract interface class ISplashWM implements IWidgetModel {
  Size get screenSize;
  Size get logoSize;
  String get logoImagePath;
  TextStyle get textStyle;
}
