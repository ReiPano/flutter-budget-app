import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> openSnackBar(
    ScaffoldMessengerState scaffoldMessenger, String message,
    {SnackBarAction? snackBarAction = null}) {
  return scaffoldMessenger.showSnackBar(
    SnackBar(
      action: snackBarAction,
      content: Text(message),
      duration: const Duration(seconds: 3),
      width: 280.0, // Width of the SnackBar.
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 18.0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
