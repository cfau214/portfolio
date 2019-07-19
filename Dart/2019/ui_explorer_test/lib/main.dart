import 'package:flutter/material.dart';
import 'app_screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Testing UI Learned in Part 2 Tutorials",
      home: Home()  
    );
  }
}
