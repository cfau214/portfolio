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
 *  [x] - Cleanup Code Before Moving Forward.
 *  [x] - Clean up UI
 */