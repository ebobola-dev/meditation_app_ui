import 'package:elementary/elementary.dart';

class TermsModel extends ElementaryModel {
  final List<bool> _agreements = [false, false, false];
  final List<bool> _agreementRequireList = const [true, true, false];

  List<bool> get agreements => _agreements;
  List<bool> get agreementRequireList => _agreementRequireList;
  bool get canGoNext {
    for (int i = 0; i < _agreements.length; i++) {
      if (_agreementRequireList[i] && !_agreements[i]) {
        return false;
      }
    }
    return true;
  }

  List<bool> changeAgreement(int index) {
    _agreements[index] = !_agreements[index];
    return List.from(_agreements);
  }

  List<bool> acceptAll() {
    for (int i = 0; i < _agreements.length; i++) {
      _agreements[i] = true;
    }
    return List.from(_agreements);
  }
}
