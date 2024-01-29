import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

class TermsModel extends ElementaryModel {
  final List<bool> _agreements = [false, false, false];
  final List<bool> _agreementsIsRequire = const [true, true, false];

  List<bool> get agreements => _agreements;
  List<bool> get agreementsIsRequire => _agreementsIsRequire;

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

  void toPreSignUp(BuildContext context) {
    log('tap toPreSignUp');
  }
}
