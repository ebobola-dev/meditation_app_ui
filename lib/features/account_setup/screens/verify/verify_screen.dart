import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify/verify_widget_model.dart';
import 'package:meditation_app_ui/features/common/widgets/back_button.dart';
import 'package:meditation_app_ui/features/common/widgets/custom_text_field.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';

class VerifyScreen extends ElementaryWidget<VerifyWM> {
  const VerifyScreen({
    super.key,
    WidgetModelFactory wmFactory = createVerifyWM,
  }) : super(wmFactory);

  @override
  Widget build(IVerifyWM wm) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wm.method.title,
                            style: wm.titleStyle,
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            wm.method.description,
                            style: wm.bodyStyle,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  CustomTextField(
                    labelText: wm.method.title.split(' ')[0],
                    keyboardType: wm.method == VerifyMethods.phoneNumber
                        ? TextInputType.number
                        : null,
                    inputFormatters: <TextInputFormatter>[
                      if (wm.method == VerifyMethods.phoneNumber)
                        FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  const Spacer(),
                  ElButton(
                    onPressed: wm.onVerifyTap,
                    child: const Text('Verify'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
