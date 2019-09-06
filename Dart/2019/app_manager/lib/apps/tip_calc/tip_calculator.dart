import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calc_home.dart';
import 'amount_provider.dart';

void main() => runApp(TipCalculator());

class TipCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AmountProvider>(
      builder: (_) => AmountProvider(),
      child: MaterialApp(
        title: 'Tip Calculator App',
        home: CalcHome(),
      ),
    );
  }
}
