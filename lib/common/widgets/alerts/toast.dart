import 'package:comprehensive_pharmacy_client_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_client_role/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String txt, ToastState toastState) => Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 80,
    backgroundColor: chooseToastColor(toastState),
    textColor: Colors.white,
    fontSize: 16.0,
);

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = TColors.greenColor;
      break;
    case ToastState.error:
      color = TColors.redColor;
      break;
    case ToastState.warning:
      color = TColors.yellowColor;
      break;
  }
  return color;
}
