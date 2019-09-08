import 'package:app_manager/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/manager_splash.dart';
import 'themes.dart';

main() => runApp(
 ChangeNotifierProvider<ThemeProvider>(
      builder: (_) => ThemeProvider(),
      child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _themeProvider = Provider.of<ThemeProvider>(context);

    return  MaterialApp(
        title: 'App Manager',
        theme: _themeProvider.theme,
        home: ManagerSplash(),
        routes: MyNavigator.routes,
    );
  }
}
