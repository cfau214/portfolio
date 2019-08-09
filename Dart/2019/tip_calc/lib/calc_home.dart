import 'package:flutter/material.dart';
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

class _CalcBodyState extends State<CalcBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBar(),
        CalcButtons(),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  num _amount = 0.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 140,
      width: double.infinity,
      padding: EdgeInsets.only(top: 80, left: 20, right: 12, bottom: 12),
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
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '\$${_amount.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
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


