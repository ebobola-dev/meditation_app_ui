import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/intro/screens/promo/promo_widget_model.dart';
import 'package:meditation_app_ui/features/intro/widgets/tab_selector_item.dart';

class PromoTabSelector extends StatelessWidget {
  final IPromoWM promoWM;
  const PromoTabSelector({super.key, required this.promoWM});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => ValueListenableBuilder(
          valueListenable: promoWM.currentPage,
          builder: (context, value, _) => TabSelectorItem(
            isActive: value == index,
            activeColor: promoWM.tabSelectorActiveColor,
            inactiveColor: promoWM.tabSelectorInactiveColor,
          ),
        ),
      ),
    );
  }
}
