import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calc/calc_home.dart';

import 'star_manager.dart';
import 'amount_provider.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResultsBody());
  }
}

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<StarManager>(
        builder: (_) => StarManager(),
        child: Column(
          children: <Widget>[
            // Expanded(
            //   flex: 2,
            //   child: ServiceBody(),
            // ),
            Divider(height: 50),
            Expanded(
              flex: 3,
              child: QuickTipAmounts(),
            ),
            Expanded(
              flex: 1,
              child: TotalsLabels(),
            ),
            Expanded(
              flex: 1,
              child: Totals(),
            ),
            Divider(height: 60),
            Expanded(
              flex: 4,
              child: GrandTotal(),
            ),
            Divider(height: 50),
          ],
        ),
      ),
    );
  }
}

class ServiceBody extends StatelessWidget {
  final _waitressPerformance = "How was your service?";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Text(_waitressPerformance),
          ),
          Expanded(
            flex: 6,
            child: StarButtonList(),
          ),
        ],
      ),
    );
  }
}

class StarButtonList extends StatefulWidget {
  @override
  _StarButtonListState createState() => _StarButtonListState();
}

class _StarButtonListState extends State<StarButtonList> {
  StarManager starProvider;

  @override
  Widget build(BuildContext context) {
    starProvider = Provider.of<StarManager>(context);

    return Row(
      children: <Widget>[...createStarList(starProvider.starList)],
    );
  }

  List<Widget> createStarList(List<Star> list) {
    return list
        .map((star) => GestureDetector(
            child: star.icon,
            onTap: () {
              starProvider.toggleStar(star);
            }))
        .toList();
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
              minWidth: 70,
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
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 70),
            child: Text(
              'Bill Amount',
              style: textStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 120),
            child: Text(
              'Plus Tip',
              style: textStyle,
            ),
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
      children: <Widget>[
        Divider(indent: 30),
        SizedBox(
          width: 150,
          child: Text(
            '${amountState.getAmountAsString}',
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
        Divider(indent: 20),
        SizedBox(
          child: Text('+'),
        ),
        Divider(indent: 30),
        SizedBox(
          child: Text(
            '${amountState.getTipAmount.toStringAsFixed(2)}',
            style: textStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: Text(
            '(@ ${amountState.tipPercent * 100}%)',
            style: TextStyle(fontSize: 12),
          ),
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
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.only(left: 42, right: 42, top: 24, bottom: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              'Total: ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              '\$${amountState.totalBill.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
