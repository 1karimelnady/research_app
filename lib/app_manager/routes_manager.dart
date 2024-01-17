import 'package:flutter/material.dart';

class RoutesManager {
  static void navigatorPush(context, Widget) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Widget;
    }));
  }

  static void pop(context) {
    Navigator.of(context).pop();
  }

  static void navigatorAndRemove(context, Widget) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Widget),
        (Route<dynamic> route) => false);
  }

  static void navigatorReplace(context, Widget) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return Widget;
    }));
  }
}
