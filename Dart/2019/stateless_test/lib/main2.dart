import 'package:flutter/material.dart';
import 'app_screens/home2.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful 2 Test',
      home: Home2()
    );
  }
}