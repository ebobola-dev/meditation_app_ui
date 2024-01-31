import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/primary_colors.dart';
import 'package:meditation_app_ui/features/account_setup/screens/pre_sign_up/pre_sign_model.dart';
import 'package:meditation_app_ui/features/account_setup/screens/pre_sign_up/pre_sign_screen.dart';
import 'package:meditation_app_ui/features/account_setup/screens/sign_up/sign_up_screen.dart';
import 'package:meditation_app_ui/utils/animated_switch_page.dart';

PreSignWM createPreSignWM(BuildContext context) => PreSignWM(PreSignModel());

class PreSignWM extends WidgetModel<PreSignScreen, PreSignModel>
    implements IPreSignWM {
  PreSignWM(super.model);

  @override
  Color get iconColor => Theme.of(context).iconTheme.color!;

  @override
  TextStyle get titleStyle => Theme.of(context).textTheme.titleSmall!.copyWith(
        color: SecondaryColors.base_,
      );

  @override
  TextStyle get subTitleStyle =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: SecondaryColors.base_,
          );

  @override
  TextStyle get bodyStyle => Theme.of(context).textTheme.bodyLarge!;

  @override
  TextStyle get bodyLinkStyle => bodyStyle.copyWith(
        color: primaryColor,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      );

  @override
  Color get primaryColor => Theme.of(context).colorScheme.primary;

  @override
  void onContinueAppleTap() {
    log(
      '[Not Implemented] Tap on "Continue With Apple Tap"',
      name: 'PreSignWM',
    );
  }

  @override
  void onContinueGoogleTap() {
    log(
      '[Not Implemented] Tap on "Continue With Google"',
      name: 'PreSignWM',
    );
  }

  @override
  void onSignInEmailTap() {
    log(
      '[Not Implemented] Tap on "Sign In Email"',
      name: 'PreSignWM',
    );
  }

  @override
  void onSignUpTap() {
    animatedSwitchPage(
      context,
      const SignUpScreen(),
      routeAnimation: RouteAnimation.scale,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOutCirc,
    );
  }
}

abstract interface class IPreSignWM implements IWidgetModel {
  Color get iconColor;
  TextStyle get titleStyle;
  TextStyle get subTitleStyle;
  TextStyle get bodyStyle;
  TextStyle get bodyLinkStyle;
  Color get primaryColor;

  void onContinueAppleTap();
  void onContinueGoogleTap();
  void onSignInEmailTap();
  void onSignUpTap();
}
