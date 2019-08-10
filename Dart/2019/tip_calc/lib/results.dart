import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Amount.dart';

class Results extends StatelessWidget {  
  final _amount;
  Results(this._amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<Amount>(
        builder: (_) => Amount.withAmount(this._amount),
        child: ResultsBody()),
    );
  }
}

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ResultAppBar(),
          Body(),
        ],
      ),
    );
  }
}

class ResultAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amtProvider = Provider.of<Amount>(context);

    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      padding: EdgeInsets.only(top: 100, left: 20, right: 12, bottom: 20),
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

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}