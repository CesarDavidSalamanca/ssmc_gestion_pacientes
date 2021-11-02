import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  final _darkThemeData = ThemeData.dark().copyWith();
  final _customThemeData = ThemeData.dark().copyWith();
  final _lightThemeData = ThemeData(
      primaryColor: Colors.green[900],
      accentColor: Colors.green,
      primaryColorDark: Color(0xff004032),
      primaryColorLight: Colors.white,
      fontFamily: 'Montserrat',
      secondaryHeaderColor: Color(0xffF2F2F2),
      dividerColor: Color(0xff999999));
  // final _lightThemeData = ThemeData.light().copyWith(
  //   primaryColor: Color(0xff03D24C),
  //   primaryColorDark: Color(0xff004032),
  //   inputDecorationTheme: InputDecorationTheme(
  //       labelStyle: TextStyle(color: Color(0xff03D24C)),
  //       focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Color(0xff03D24C)))),
  //   indicatorColor: Color(0xffF214D3),

  //   accentColor: Color(0xffF214D3),
  //   errorColor: Color(0xffF115D1),
  //   primaryColorLight: Colors.white,
  //   secondaryHeaderColor: Color(0xffF7F7F7),
  //   dividerColor: Color(0xffE6E6E6),
  //   // scaffoldBackgroundColor: Colors.white,
  //   //Footer background
  //   snackBarTheme: SnackBarThemeData(backgroundColor: Color(0xffF2F2F2)),
  //   textTheme: TextTheme(
  //     bodyText1: TextStyle(
  //       color: Color(0xff1A1A1A),
  //     ),
  //     bodyText2: TextStyle(color: Color(0xff1A1A1A)),
  //   ),
  // );

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //ligth
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = _lightThemeData;
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = _darkThemeData;
        break;
      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = _customThemeData;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = _lightThemeData;
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    _customTheme = false;

    if (value) {
      _currentTheme = _darkThemeData;
    } else {
      _currentTheme = _lightThemeData;
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currentTheme = _customThemeData;
    } else {
      _currentTheme = _lightThemeData;
    }
    notifyListeners();
  }
}
