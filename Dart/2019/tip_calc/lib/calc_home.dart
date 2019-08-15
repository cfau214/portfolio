import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'amount_provider.dart';
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
    return Container(
      child: Column(
        children: <Widget>[
          // Top Bar - Flex should be 25% of total column
          Expanded(
            flex: 3,
            child: TopBar(),
          ),
          // Calculator Buttons
          Expanded(
            flex: 9,
            child: CalcButtons(),
          ),
          // Bottom Bar
          BottomBar(),
        ],
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
    var amountState = Provider.of<AmountProvider>(context);

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
              '\$${amountState.getAmountAsString}',
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

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(color: Colors.lightBlue),
    );
  }
}
