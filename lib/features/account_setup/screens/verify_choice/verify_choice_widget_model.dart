import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify/verify_screen.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify_choice/verify_choice_model.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify_choice/verify_choice_screen.dart';
import 'package:meditation_app_ui/utils/animated_switch_page.dart';
import 'package:meditation_app_ui/utils/animations.dart';
import 'package:provider/provider.dart';

VerifyChoiceWM createVerifyChoiceWM(BuildContext context) =>
    VerifyChoiceWM(VerifyChoiceModel());

class VerifyChoiceWM extends WidgetModel<VerifyChoiceScreen, VerifyChoiceModel>
    implements IVerifyChoiceWM {
  VerifyChoiceWM(super.model);

  late final ValueNotifier<VerifyMethods?> _currentMethod;
  final GlobalKey<ShakingAnimationState> _methodsAnimationKey =
      GlobalKey<ShakingAnimationState>();

  @override
  void initWidgetModel() {
    _currentMethod = ValueNotifier<VerifyMethods?>(model.currentMethod);
    super.initWidgetModel();
  }

  @override
  GlobalKey<ShakingAnimationState> get methodsAnimationKey =>
      _methodsAnimationKey;

  @override
  ValueNotifier<VerifyMethods?> get currentMethod => _currentMethod;

  @override
  Color get iconColor => Theme.of(context).iconTheme.color!;

  @override
  TextStyle get titleStyle => Theme.of(context).textTheme.displayLarge!;

  @override
  TextStyle get bodyStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get cardTitleStyle => bodyStyle.copyWith(
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get cardBodyStyle => Theme.of(context).textTheme.bodySmall!;

  @override
  Color get primaryColor => Theme.of(context).colorScheme.primary;

  @override
  void onMethodTap(VerifyMethods method) {
    _currentMethod.value = model.set(method);
  }

  @override
  void onContinueTap() {
    if (!model.canContinue) {
      _methodsAnimationKey.currentState?.shake();
      return;
    }
    animatedSwitchPage(
      context,
      Provider(
        create: (context) => model.currentMethod,
        child: VerifyScreen(),
      ),
      routeAnimation: RouteAnimation.slideLeft,
    );
  }
}

abstract interface class IVerifyChoiceWM implements IWidgetModel {
  Color get iconColor;
  TextStyle get titleStyle;
  TextStyle get bodyStyle;
  TextStyle get cardTitleStyle;
  TextStyle get cardBodyStyle;
  Color get primaryColor;

  ValueNotifier<VerifyMethods?> get currentMethod;
  GlobalKey<ShakingAnimationState> get methodsAnimationKey;

  void onMethodTap(VerifyMethods method);
  void onContinueTap();
}
