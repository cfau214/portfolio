import 'package:flutter/material.dart';
//import 'package:startup_namer/random_words/lib/random_words.dart';
import 'package:startup_namer/random_numbers/lib/random_numbers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomNumbers(),
    );
  }
}
