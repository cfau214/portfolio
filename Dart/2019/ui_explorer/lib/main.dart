import 'package:flutter/material.dart';
import './app_screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Explorer App',
      home: Home(),
    );
  }
}
