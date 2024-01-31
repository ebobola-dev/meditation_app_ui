import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/primary_colors.dart';
import 'package:meditation_app_ui/features/account_setup/screens/sign_up/sign_up_model.dart';
import 'package:meditation_app_ui/features/account_setup/screens/sign_up/sign_up_screen.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify_choice/verify_choice_screen.dart';
import 'package:meditation_app_ui/utils/animated_switch_page.dart';

SignUpWM createSignUpWM(BuildContext context) => SignUpWM(SignUpModel());

class SignUpWM extends WidgetModel<SignUpScreen, SignUpModel>
    implements ISignUpWM {
  SignUpWM(super.model);

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final ValueNotifier<bool> _showPassword;

  @override
  void initWidgetModel() {
    _showPassword = ValueNotifier<bool>(false);
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initWidgetModel();
  }

  @override
  TextEditingController get nameController => _nameController;

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  ValueNotifier<bool> get showPassword => _showPassword;

  @override
  Color get iconColor => Theme.of(context).iconTheme.color!;

  @override
  TextStyle get titleStyle => Theme.of(context).textTheme.displaySmall!;

  @override
  TextStyle get subTitleStyle =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: SecondaryColors.base_,
          );

  @override
  TextStyle get bodyStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get bodyLinkStyle => bodyStyle.copyWith(
        color: primaryColor,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      );

  @override
  Color get primaryColor => Theme.of(context).colorScheme.primary;

  @override
  void onEyeButtonTap() {
    _showPassword.value = !_showPassword.value;
  }

  @override
  void onContinueAppleTap() {
    log(
      '[Not Implemented] Tap on "Continue With Apple Tap"',
      name: 'SignUpWM',
    );
  }

  @override
  void onContinueGoogleTap() {
    log(
      '[Not Implemented] Tap on "Continue With Google"',
      name: 'SignUpWM',
    );
  }

  @override
  void onCreateAccountTap() {
    animatedSwitchPage(
      context,
      const VerifyChoiceScreen(),
      routeAnimation: RouteAnimation.slideLeft,
    );
  }

  @override
  void onSignInTap() {
    log(
      '[Not Implemented] Tap on "Sign In"',
      name: 'SignUpWM',
    );
  }
}

abstract interface class ISignUpWM implements IWidgetModel {
  Color get iconColor;
  TextStyle get titleStyle;
  TextStyle get subTitleStyle;
  TextStyle get bodyStyle;
  TextStyle get bodyLinkStyle;
  Color get primaryColor;

  TextEditingController get nameController;
  TextEditingController get emailController;
  TextEditingController get passwordController;
  ValueNotifier<bool> get showPassword;

  void onEyeButtonTap();
  void onContinueAppleTap();
  void onContinueGoogleTap();
  void onCreateAccountTap();
  void onSignInTap();
}
