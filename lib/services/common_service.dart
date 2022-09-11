import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> openSnackBar(
    ScaffoldMessengerState scaffoldMessenger, String message,
    {SnackBarAction? snackBarAction}) {
  var hasAction = snackBarAction != null;
  var paddingLeft = hasAction ? 18.0 : 0.0;

  return scaffoldMessenger.showSnackBar(
    SnackBar(
      action: snackBarAction,
      content: SizedBox(
        height: 50,
        child: Center(
          child: Text(message),
        ),
      ),
      duration: const Duration(seconds: 3),
      width: 280.0, // Width of the SnackBar.
      padding: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
        left: paddingLeft,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
