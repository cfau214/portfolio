import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'amount_provider.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ResultsBody(),
      ),
    );
  }
}

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 3),
          Expanded(
            flex: 3,
            child: QuickTipAmounts(),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 1,
            child: TotalsLabels(),
          ),
          Expanded(
            flex: 3,
            child: Totals(),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 3,
            child: GrandTotal(),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}

class QuickTipAmounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amountState = Provider.of<AmountProvider>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Quick Tips: '),
          for (int i = 15; i <= 25; i += 5)
            ButtonTheme(
              minWidth: 80,
              height: 50,
              child: RaisedButton(
                elevation: 8,
                padding: EdgeInsets.all(0),
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Text(
                  '$i%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: () {
                  HapticFeedback.vibrate();
                  amountState.setTip(i);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class TotalsLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontStyle: FontStyle.italic,
    );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'Bill Amount',
            style: textStyle,
          ),
          Text(
            'Plus Tip',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

class Totals extends StatefulWidget {
  @override
  _TotalsState createState() => _TotalsState();
}

class _TotalsState extends State<Totals> {
  @override
  Widget build(BuildContext context) {
    var amountState = Provider.of<AmountProvider>(context);
    var textStyle = TextStyle(
      fontSize: 32,
      fontStyle: FontStyle.italic,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            '${amountState.getAmountAsString}',
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text('+'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            '${amountState.getTipAmount.toStringAsFixed(2)}',
            style: textStyle,
          ),
        ),
        Text(
          '(@ ${amountState.tipPercent * 100}%)',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class GrandTotal extends StatefulWidget {
  @override
  _GrandTotalState createState() => _GrandTotalState();
}

class _GrandTotalState extends State<GrandTotal> {
  @override
  Widget build(BuildContext context) {
    var amountState = Provider.of<AmountProvider>(context);

    return Card(
      elevation: 8,
      color: Colors.indigoAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Total: ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          Text(
            '\$${amountState.totalBill.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
