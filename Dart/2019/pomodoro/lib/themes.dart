import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.lightBlue,
    textTheme: ButtonTextTheme.normal,
  ),
  iconTheme: IconThemeData(color: Colors.lightBlue)
);

final ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey.shade700,
    textTheme: ButtonTextTheme.normal,
  ),
  iconTheme: IconThemeData(color: Colors.white)
);

class ThemeProvider with ChangeNotifier {
  ThemeProvider();

  bool value = false;
  get theme => value == false ? light : dark;

  toggleValue() {
    value = !value;
    notifyListeners();
  }
}