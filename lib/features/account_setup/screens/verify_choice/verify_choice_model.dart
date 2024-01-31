import 'package:elementary/elementary.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';

class VerifyChoiceModel extends ElementaryModel {
  VerifyMethods? _currentMethod;

  VerifyMethods? get currentMethod => _currentMethod;
  bool get canContinue => _currentMethod != null;

  VerifyMethods? set(VerifyMethods method) {
    if (_currentMethod == method) {
      _currentMethod = null;
    } else {
      _currentMethod = method;
    }
    return _currentMethod;
  }
}
