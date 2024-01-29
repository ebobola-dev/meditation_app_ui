import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';
import 'package:meditation_app_ui/features/account_setup/screens/terms_conditions/terms_widget_model.dart';
import 'package:meditation_app_ui/features/account_setup/widgets/condition_card.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';

class TermsScreen extends ElementaryWidget<TermsWM> {
  const TermsScreen({
    super.key,
    WidgetModelFactory wmFactory = createTermsWM,
  }) : super(wmFactory);

  @override
  Widget build(ITermsWM wm) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: wm.onBackTap,
                    icon: SvgPicture.asset(
                      IconPaths.arrowLeft,
                      colorFilter: ColorFilter.mode(
                        wm.iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Let’s get you started!",
                            style: wm.titleStyle,
                          ),
                        ),
                        const SizedBox(height: 68.0),
                        ValueListenableBuilder(
                          valueListenable: wm.agreements,
                          builder: (context, value, _) {
                            return ListView.separated(
                              itemCount: wm.conditionDescriptions.length,
                              shrinkWrap: true,
                              separatorBuilder: (context, _) =>
                                  const SizedBox(height: 27.0),
                              itemBuilder: (context, index) => ConditionCard(
                                description: wm.conditionDescriptions[index],
                                isAgree: value[index],
                                onToggle: (_) => wm.onConditionTap(index),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 72.0),
                        ElButton(
                          onPressed: wm.onAcceptAllTap,
                          child: const Text('Accept all'),
                        ),
                        const SizedBox(height: 12.0),
                        ElButton(
                          onPressed: wm.onAcceptAllTap,
                          alternativeBackground: true,
                          child: Text(
                            'Next',
                            style: wm.acceptAllButtonTextStyle,
                          ),
                        ),
                        const SizedBox(height: 28.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '*You can withdraw your consent anytime by contacting us at ',
                                  style: wm.bodyStyle,
                                ),
                                TextSpan(
                                  text: 'support@support.com',
                                  style: wm.bodyLinkStyle,
                                ),
                              ],
                            ),
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
