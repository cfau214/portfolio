import 'package:flutter/material.dart';
//import 'package:random_generators/random_words/lib/random_words.dart';
import 'package:random_generators/random_numbers/lib/random_numbers.dart';

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
