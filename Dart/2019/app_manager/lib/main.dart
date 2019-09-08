import 'package:app_manager/navigator.dart';
import 'package:flutter/material.dart';
import 'screens/manager_splash.dart';

main() => runApp(MyApp());

final ThemeData _themeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.lightBlueAccent,
  primaryTextTheme: Typography.whiteCupertino,
  textTheme: Typography.whiteCupertino,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.lightBlue,
    textTheme: ButtonTextTheme.normal,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Manager',
      theme: _themeData,
      home: ManagerSplash(),
      routes: MyNavigator.routes,
    );
  }
}
