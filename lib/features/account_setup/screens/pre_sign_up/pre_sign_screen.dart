import 'package:elementary/elementary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app_ui/assets/resources/resources.dart';
import 'package:meditation_app_ui/features/account_setup/screens/pre_sign_up/pre_sign_widget_model.dart';
import 'package:meditation_app_ui/features/account_setup/widgets/google_apple_buttons.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';

class PreSignScreen extends ElementaryWidget<PreSignWM> {
  const PreSignScreen({
    super.key,
    WidgetModelFactory wmFactory = createPreSignWM,
  }) : super(wmFactory);

  @override
  Widget build(IPreSignWM wm) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 12.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Stack(
                      alignment: const Alignment(0.0, -0.1),
                      children: [
                        Image.asset(
                          ImagePaths.preSign,
                          fit: BoxFit.fill,
                          height: double.infinity,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'clarity'.toUpperCase(),
                              style: wm.titleStyle,
                            ),
                            Text(
                              'Your reset begins here. ',
                              style: wm.subTitleStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                GoogleAppleButtons(
                  onAppleButtonTap: wm.onContinueAppleTap,
                  onGoogleButtonTap: wm.onContinueGoogleTap,
                ),
                const SizedBox(height: 12.0),
                ElButton(
                  onPressed: wm.onSignInEmailTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        IconPaths.mail,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Sign In with Email',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Not a member? ',
                        style: wm.bodyStyle,
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: wm.bodyLinkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = wm.onSignUpTap,
                      ),
                    ],
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
