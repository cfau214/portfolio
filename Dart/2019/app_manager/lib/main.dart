import 'package:flutter/material.dart';
import 'screens/manager_splash.dart';
import 'screens/manager_home.dart';
import 'apps/tip_calc/tip_calculator.dart';

main() => runApp(MyApp());

final ThemeData _themeData = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.lightBlueAccent,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Manager',
      theme: _themeData,
      home: ManagerSplash(),
      routes: <String, WidgetBuilder> {
        '/home' : (BuildContext context) => ManagerHome(),
        '/tipCalculator' : (BuildContext context) => TipCalculator(),
      },
    );
  }
}
