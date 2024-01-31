import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify/verify_model.dart';
import 'package:meditation_app_ui/features/account_setup/screens/verify/verify_screen.dart';
import 'package:provider/provider.dart';

VerifyWM createVerifyWM(BuildContext context) => VerifyWM(
      VerifyModel(context.read<VerifyMethods>()),
    );

class VerifyWM extends WidgetModel<VerifyScreen, VerifyModel>
    implements IVerifyWM {
  VerifyWM(super.model);

  late final TextEditingController _textController;

  @override
  void initWidgetModel() {
    _textController = TextEditingController();
    super.initWidgetModel();
  }

  @override
  VerifyMethods get method => model.method;

  @override
  TextEditingController get textController => _textController;

  @override
  Color get iconColor => Theme.of(context).iconTheme.color!;

  @override
  TextStyle get titleStyle => Theme.of(context).textTheme.displayLarge!;

  @override
  TextStyle get bodyStyle => Theme.of(context).textTheme.bodyMedium!;

  @override
  void onVerifyTap() {}
}

abstract interface class IVerifyWM implements IWidgetModel {
  VerifyMethods get method;
  Color get iconColor;
  TextStyle get titleStyle;
  TextStyle get bodyStyle;

  TextEditingController get textController;

  void onVerifyTap();
}
