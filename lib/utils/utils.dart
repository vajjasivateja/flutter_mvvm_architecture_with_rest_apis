import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static filedFocusChange(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static void flushBarErrorMessage(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          backgroundColor: Colors.red,
          messageColor: Colors.white,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          padding: EdgeInsets.all(20),
          icon: const Icon(Icons.error, size: 20, color: Colors.white),
          flushbarPosition: FlushbarPosition.BOTTOM,
        )..show(context));
  }

  static void flushBarSuccessMessage(String msg, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: msg,
          backgroundColor: Colors.green,
          messageColor: Colors.white,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          padding: EdgeInsets.all(20),
          icon: const Icon(Icons.error, size: 20, color: Colors.white),
          flushbarPosition: FlushbarPosition.BOTTOM,
        )..show(context));
  }

  static snackBar(String msg, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.red,
    ));
  }
}
