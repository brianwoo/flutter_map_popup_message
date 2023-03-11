import 'dart:developer';

import 'package:flutter/material.dart';

class PinInfo {
  String msg;
  bool visibility;
  Color color;

  PinInfo(this.visibility, {this.msg = "", this.color = Colors.black});

  @override
  String toString() => 'PinInfo [$visibility, $msg]';
}

class PinInfoProvider with ChangeNotifier {
  PinInfo _pinInfo = PinInfo(false);

  void updatePinInfoPanel(bool visibility, {String? msg, Color? color}) {
    if (msg != null && color != null) {
      _pinInfo = PinInfo(visibility, msg: msg, color: color);
    } else {
      _pinInfo = PinInfo(visibility);
    }
    notifyListeners();
  }

  PinInfo get pinInfo {
    log("$_pinInfo", name: "pinInfo");
    return _pinInfo;
  }
}
