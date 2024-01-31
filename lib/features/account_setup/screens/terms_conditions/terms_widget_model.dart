import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/account_setup/models/conditions_data.dart';
import 'package:meditation_app_ui/features/account_setup/screens/pre_sign_up/pre_sign_screen.dart';
import 'package:meditation_app_ui/features/account_setup/screens/terms_conditions/terms_model.dart';
import 'package:meditation_app_ui/features/account_setup/screens/terms_conditions/terms_screen.dart';
import 'package:meditation_app_ui/utils/animated_switch_page.dart';
import 'package:meditation_app_ui/utils/animations.dart';

TermsWM createTermsWM(BuildContext context) => TermsWM(TermsModel());

class TermsWM extends WidgetModel<TermsScreen, TermsModel>
    with SingleTickerProviderWidgetModelMixin
    implements ITermsWM {
  TermsWM(super.model);

  late final ValueNotifier<List<bool>> _agreements;
  final List<GlobalKey<ShakingAnimationState>> _conditionAnimationKeys = [
    GlobalKey<ShakingAnimationState>(),
    GlobalKey<ShakingAnimationState>(),
  ];

  @override
  void initWidgetModel() {
    _agreements = ValueNotifier<List<bool>>(model.agreements);
    super.initWidgetModel();
  }

  @override
  List<GlobalKey<ShakingAnimationState>> get conditionAnimationKeys =>
      _conditionAnimationKeys;

  @override
  ValueNotifier<List<bool>> get agreements => _agreements;

  @override
  List<bool> get requiredConditionList => model.agreementRequireList;

  @override
  Size get screenSize => MediaQuery.of(context).size;

  @override
  Color get iconColor => Theme.of(context).iconTheme.color!;

  @override
  TextStyle get titleStyle => Theme.of(context).textTheme.displayLarge!;

  @override
  TextStyle get bodyStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get bodyLinkStyle => bodyStyle.copyWith(
        color: primaryColor,
        decoration: TextDecoration.underline,
      );

  @override
  Color get primaryColor => Theme.of(context).colorScheme.primary;

  @override
  List<Widget> get conditionDescriptions =>
      getConditionsData(bodyStyle, bodyLinkStyle);

  @override
  void onBackTap() {
    Navigator.pop(context);
  }

  @override
  void onConditionTap(int index) {
    agreements.value = model.changeAgreement(index);
  }

  @override
  void onAcceptAllTap() {
    agreements.value = model.acceptAll();
  }

  @override
  void onNextTap() async {
    if (!model.canGoNext) {
      for (int i = 0; i < _conditionAnimationKeys.length; i++) {
        if (!_agreements.value[i]) {
          _conditionAnimationKeys[i].currentState?.shake();
        }
      }
      return;
    }
    animatedSwitchPage(
      context,
      const PreSignScreen(),
      routeAnimation: RouteAnimation.slideLeft,
    );
  }
}

abstract interface class ITermsWM implements IWidgetModel {
  Size get screenSize;
  Color get iconColor;
  TextStyle get titleStyle;
  TextStyle get bodyStyle;
  TextStyle get bodyLinkStyle;
  Color get primaryColor;

  List<Widget> get conditionDescriptions;
  List<bool> get requiredConditionList;

  List<GlobalKey<ShakingAnimationState>> get conditionAnimationKeys;
  ValueNotifier<List<bool>> get agreements;

  void onBackTap();
  void onConditionTap(int index);
  void onAcceptAllTap();
  void onNextTap();
}
