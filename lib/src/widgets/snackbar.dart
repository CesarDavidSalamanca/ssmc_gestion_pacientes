import 'package:flutter/material.dart';

SnackBar mySnackBarError(double width, ThemeData currentTheme, String message) {
  return SnackBar(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: width * 0.05),
      elevation: 1,
      backgroundColor: currentTheme.errorColor,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: currentTheme.primaryColorLight, fontSize: width * 0.04),
      ));
}

SnackBar mySnackBarSuccessful(
    double width, ThemeData currentTheme, String message) {
  return SnackBar(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: width * 0.05),
      elevation: 1,
      backgroundColor: currentTheme.buttonColor,
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: currentTheme.primaryColorLight, fontSize: width * 0.04),
      ));
}
