import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Amount.dart';
import 'calc_buttons.dart';

class CalcHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalcBody(),
    );
  }
}

class CalcBody extends StatefulWidget {
  @override
  _CalcBodyState createState() => _CalcBodyState();
}

/// CalcBodyState - The main user interface for the calculator' home.
///
/// This includes a [TopBar] that displays the amount being entered by the user and
/// a buttom container of [CalcButtons] that generates the buttons for the calculator.
///
class _CalcBodyState extends State<CalcBody> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Amount>(
      builder: (_) => Amount(),
      child: Container(
        child: Column(
          children: <Widget>[
            // Top Bar
            Expanded(
              flex: 3,
              child: TopBar(),
            ),
            // Calculator Buttons
            Expanded(
              flex: 9,
              child: CalcButtons(),
            )
          ],
        ),
      ),
    );
  }
}

/// TopBar - The 'AppBar' for the Calculator's home within the [_CalcBodyState].
///
/// Keeps track of the amount entered by the user through the [amountState] change provider.
///
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amtProvider = Provider.of<Amount>(context);

    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      padding: EdgeInsets.only(top: 80, left: 20, right: 12, bottom: 20),
      color: Colors.lightBlueAccent,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 80,
            child: Text(
              'Bill Amount:',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          // Amount Display
          Expanded(
            flex: 3,
            child: Text(
              '\$${amtProvider.getAmountAsString}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(flex: 1, child: Divider())
        ],
      ),
    );
  }
}
