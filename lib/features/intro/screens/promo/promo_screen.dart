import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';
import 'package:meditation_app_ui/features/intro/screens/promo/promo_widget_model.dart';
import 'package:meditation_app_ui/features/intro/widgets/promo_card.dart';
import 'package:meditation_app_ui/features/intro/widgets/promo_tab_selector.dart';

class PromoScreen extends ElementaryWidget<PromoWM> {
  const PromoScreen({
    super.key,
    WidgetModelFactory wmFactory = createPromoWM,
  }) : super(wmFactory);

  @override
  Widget build(IPromoWM wm) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Flexible(
                  flex: 16,
                  child: PageView(
                    controller: wm.pageController,
                    onPageChanged: (value) => wm.onSwipe(value),
                    children: wm.pagesData
                        .map((pageData) => PromoCard(
                              data: pageData,
                              titleStyle: wm.titleStyle,
                              descriptionStyle: wm.descriptionStyle,
                            ))
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                    child: Column(
                      children: [
                        PromoTabSelector(promoWM: wm),
                        const Spacer(),
                        ValueListenableBuilder(
                            valueListenable: wm.currentPage,
                            builder: (context, value, _) {
                              return ElButton(
                                onPressed: wm.onNextTap,
                                child: Text(value == 3 ? "Let's begin" : 'Next',
                                    style: wm.elButtonTextStyle),
                              );
                            }),
                        const SizedBox(height: 3.0),
                        TextButton(
                          onPressed: wm.onSingInTap,
                          style: TextButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            foregroundColor: wm.primaryColor,
                          ),
                          child: Text(
                            'Sing In',
                            style: wm.textButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
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
