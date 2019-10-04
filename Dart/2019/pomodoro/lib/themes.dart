import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
    fontFamily: 'FiraCode',
    brightness: Brightness.light,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.lightBlue,
      textTheme: ButtonTextTheme.normal,
    ),
    iconTheme: IconThemeData(color: Colors.lightBlue));

final ThemeData dark = ThemeData(
    fontFamily: 'FiraCode',
    brightness: Brightness.dark,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.normal,
    ),
    iconTheme: IconThemeData(color: Colors.white));

class ThemeProvider with ChangeNotifier {
  ThemeProvider();

  bool value = false;
  get theme => value == false ? light : dark;

  toggleValue() {
    value = !value;
    notifyListeners();
  }
}
