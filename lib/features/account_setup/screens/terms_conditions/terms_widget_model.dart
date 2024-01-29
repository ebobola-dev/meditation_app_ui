import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/ext_colors.dart';
import 'package:meditation_app_ui/features/account_setup/models/conditions_data.dart';
import 'package:meditation_app_ui/features/account_setup/screens/terms_conditions/terms_model.dart';
import 'package:meditation_app_ui/features/account_setup/screens/terms_conditions/terms_screen.dart';

TermsWM createTermsWM(BuildContext context) => TermsWM(TermsModel());

class TermsWM extends WidgetModel<TermsScreen, TermsModel> implements ITermsWM {
  TermsWM(super.model);

  late final ValueNotifier<List<bool>> _agreements;

  @override
  void initWidgetModel() {
    _agreements = ValueNotifier<List<bool>>(model.agreements);
    super.initWidgetModel();
  }

  @override
  ValueNotifier<List<bool>> get agreements => _agreements;

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
  TextStyle get elButtonTextStyle =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          );

  @override
  TextStyle get acceptAllButtonTextStyle => TextStyle(
        color: Theme.of(context).extension<TextExtColors>()!.black,
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
  void onNextTap() {
    model.toPreSignUp(context);
  }
}

abstract interface class ITermsWM implements IWidgetModel {
  Size get screenSize;
  Color get iconColor;
  TextStyle get titleStyle;
  TextStyle get bodyStyle;
  TextStyle get bodyLinkStyle;
  TextStyle get elButtonTextStyle;
  TextStyle get acceptAllButtonTextStyle;
  Color get primaryColor;

  ValueNotifier<List<bool>> get agreements;
  List<Widget> get conditionDescriptions;

  void onBackTap();
  void onConditionTap(int index);
  void onAcceptAllTap();
  void onNextTap();
}
