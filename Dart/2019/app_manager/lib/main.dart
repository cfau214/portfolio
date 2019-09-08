import 'package:app_manager/navigator.dart';
import 'package:flutter/material.dart';

import 'screens/manager_splash.dart';
import 'themes.dart' as themes;

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Manager',
      theme: themes.light,
      home: ManagerSplash(),
      routes: MyNavigator.routes,
    );
  }
}
