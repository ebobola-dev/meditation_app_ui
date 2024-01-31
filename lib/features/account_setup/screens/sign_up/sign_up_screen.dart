import 'package:elementary/elementary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/account_setup/screens/sign_up/sign_up_widget_model.dart';
import 'package:meditation_app_ui/features/account_setup/widgets/google_apple_buttons.dart';
import 'package:meditation_app_ui/features/account_setup/widgets/password_eye_button.dart';
import 'package:meditation_app_ui/features/account_setup/widgets/sign_divider.dart';
import 'package:meditation_app_ui/features/common/widgets/back_button.dart';
import 'package:meditation_app_ui/features/common/widgets/custom_text_field.dart';
import 'package:meditation_app_ui/features/common/widgets/el_button.dart';

class SignUpScreen extends ElementaryWidget<SignUpWM> {
  const SignUpScreen({
    super.key,
    WidgetModelFactory wmFactory = createSignUpWM,
  }) : super(wmFactory);

  @override
  Widget build(ISignUpWM wm) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MyBackButton(),
                        Text(
                          "Sign Up",
                          style: wm.titleStyle,
                        ),
                        const SizedBox(width: 48.0),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    GoogleAppleButtons(
                      onAppleButtonTap: wm.onContinueAppleTap,
                      onGoogleButtonTap: wm.onContinueGoogleTap,
                    ),
                    const SizedBox(height: 48.0),
                    const SignDiviver(text: 'Or sign up with email'),
                    const SizedBox(height: 48.0),
                    CustomTextField(
                      controller: wm.nameController,
                      labelText: 'Name',
                    ),
                    const SizedBox(height: 12.0),
                    CustomTextField(
                      controller: wm.emailController,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 12.0),
                    ValueListenableBuilder(
                      valueListenable: wm.showPassword,
                      builder: (context, show, _) {
                        return CustomTextField(
                          controller: wm.passwordController,
                          labelText: 'Password',
                          obscureText: !show,
                          additionalSuffixWidget: PasswordEyeButton(
                            close: show,
                            onTap: wm.onEyeButtonTap,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12.0),
                    ElButton(
                      onPressed: wm.onCreateAccountTap,
                      child: const Text('Create account'),
                    ),
                    const SizedBox(height: 48.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: wm.bodyStyle,
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: wm.bodyLinkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = wm.onSignInTap,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
