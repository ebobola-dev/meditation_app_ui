import 'package:elementary/elementary.dart';
import 'package:meditation_app_ui/features/account_setup/models/verify_methods.dart';

class VerifyModel extends ElementaryModel {
  final VerifyMethods _method;

  VerifyModel(this._method);

  VerifyMethods get method => _method;
}
