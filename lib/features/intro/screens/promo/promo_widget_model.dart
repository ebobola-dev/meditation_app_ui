import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/assets/colors/primary_colors.dart';
import 'package:meditation_app_ui/features/account_setup/screens/terms_conditions/terms_screen.dart';
import 'package:meditation_app_ui/features/intro/models/promo_page_data.dart';
import 'package:meditation_app_ui/features/intro/screens/promo/promo_model.dart';
import 'package:meditation_app_ui/features/intro/screens/promo/promo_screen.dart';
import 'package:meditation_app_ui/utils/animated_switch_page.dart';

PromoWM createPromoWM(BuildContext context) => PromoWM(PromoModel());

class PromoWM extends WidgetModel<PromoScreen, PromoModel> implements IPromoWM {
  PromoWM(super.model);

  final PageController _pageController = PageController();
  late final ValueNotifier<int> _currentPage;

  @override
  void initWidgetModel() {
    _currentPage = ValueNotifier<int>(0);
    super.initWidgetModel();
  }

  @override
  ValueNotifier<int> get currentPage => _currentPage;

  @override
  Size get screenSize => MediaQuery.of(context).size;

  @override
  TextStyle get titleStyle => Theme.of(context).textTheme.displaySmall!;

  @override
  TextStyle get descriptionStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  TextStyle get textButtonTextStyle =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
            decoration: TextDecoration.underline,
          );

  @override
  List<PromoPageData> get pagesData => model.pagesData;

  @override
  Color get primaryColor => Theme.of(context).primaryColor;

  @override
  Color get tabSelectorActiveColor => PrimaryColors.base_;

  @override
  Color get tabSelectorInactiveColor => PrimaryColors.c100;

  @override
  PageController get pageController => _pageController;

  @override
  void onSwipe(int newPage) {
    _currentPage.value = model.swipe(newPage);
  }

  @override
  void onNextTap() {
    if (model.currentPage != 3) {
      _pageController.animateToPage(
        model.currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      return;
    }
    toSignIn();
  }

  @override
  void onSingInTap() {
    toSignIn();
  }

  void toSignIn() {
    animatedSwitchPage(
      context,
      const TermsScreen(),
      routeAnimation: RouteAnimation.slideBottom,
    );
  }
}

abstract interface class IPromoWM implements IWidgetModel {
  ValueNotifier<int> get currentPage;
  Size get screenSize;
  List<PromoPageData> get pagesData;
  TextStyle get titleStyle;
  TextStyle get descriptionStyle;
  TextStyle get textButtonTextStyle;
  Color get primaryColor;
  Color get tabSelectorActiveColor;
  Color get tabSelectorInactiveColor;

  PageController get pageController;

  void onSwipe(int newPage);
  void onNextTap();
  void onSingInTap();
}
