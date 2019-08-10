import 'package:flutter/material.dart';
import 'calc_home.dart';

void main() => runApp(TipCalculator());

class TipCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator App',
      home: CalcHome(),
    );
  }
}

/**
 * TODO:
 * [x] - Learn how to switch screens.
 * [x] - Refactor calc buttons to use widgets instead of functions, this way we can remove the global variables and use a change provider instead.
 */