import 'package:flutter/material.dart';

import 'screens/manager_home.dart';
import 'apps/tip_calc/tip_calculator.dart';

class MyNavigator {
  static var routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => ManagerHome(),
    '/tipCalculator': (BuildContext context) => TipCalculator(),
  };
}
