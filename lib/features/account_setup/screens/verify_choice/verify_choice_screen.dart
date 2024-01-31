import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/account_setup/widgets/verify_method_card.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify_choice/verify_choice_widget_model.dart';
import 'package:meditation_app_ui/features/common/widgets/back_button.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';
import 'package:meditation_app_ui/utils/animations.dart';

class VerifyChoiceScreen extends ElementaryWidget<VerifyChoiceWM> {
  const VerifyChoiceScreen({
    super.key,
    WidgetModelFactory wmFactory = createVerifyChoiceWM,
  }) : super(wmFactory);

  @override
  Widget build(IVerifyChoiceWM wm) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 24.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: MyBackButton(),
                ),
                const SizedBox(width: 24.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verify your account',
                          style: wm.titleStyle,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'Choose a method of verification.',
                          style: wm.bodyStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                ShakingAnimation(
                  key: wm.methodsAnimationKey,
                  child: ValueListenableBuilder(
                    valueListenable: wm.currentMethod,
                    builder: (context, currentMethod, _) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: VerifyMethods.values.length,
                        separatorBuilder: (context, _) =>
                            const SizedBox(height: 16.0),
                        itemBuilder: (context, index) => VerifyMethodCard(
                          method: VerifyMethods.values[index],
                          titleStyle: wm.cardTitleStyle,
                          bodyStyle: wm.cardBodyStyle,
                          onTap: () => wm.onMethodTap(
                            VerifyMethods.values[index],
                          ),
                          selected:
                              currentMethod == VerifyMethods.values[index],
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                ElButton(
                  onPressed: wm.onContinueTap,
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
