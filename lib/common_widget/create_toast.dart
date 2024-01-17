import '../app_manager/local_data.dart';
import 'package:flutter/material.dart';
import '../utilities/text_style.dart';
import 'package:toast/toast.dart';

class CreatToast {
  void showToast(
      {required String errorMessage,
      required BuildContext context,
      int? gravity,
      int? duration,
      Color? backgroundColor,
      TextStyle? labelStyle}) {
    ToastContext().init(context);
    Toast.show(
      errorMessage,
      textStyle: labelStyle ?? WhiteLabel.display5(context),
      duration: duration ?? Toast.lengthLong,
      gravity: gravity ?? Toast.center,
      backgroundRadius: 10,
      backgroundColor: backgroundColor ?? mainColor,
    );
  }

  void showCodeToast(
      {required String errorMessage,
      required BuildContext context,
      int? gravity,
      Color? backgroundColor,
      TextStyle? labelStyle}) {
    ToastContext().init(context);
    Toast.show(
      errorMessage,
      textStyle: labelStyle ?? WhiteLabel.display5(context),
      duration: Toast.lengthLong,
      gravity: gravity ?? Toast.center,
      backgroundRadius: 10,
      backgroundColor: backgroundColor ?? mainColor,
    );
  }
}
