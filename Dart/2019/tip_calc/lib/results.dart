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
            // Top Bar
            Expanded(
              flex: 3,
              child: TopBar(),
            ),
            // Calculator Buttons
            Expanded(
              flex: 2,
              child: ServiceBody(),
            ),
            Expanded(
              flex: 2,
              child: QuickTipAmounts(),
            ),
            // Divider
            Expanded(
              flex: 7,
              child: Divider(),
            ),
            // Bottom Bar
            BottomBar(),
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
          for (int i = 15; i < 25; i += 5)
            ButtonTheme(
              minWidth: 70,
              child: RaisedButton(
                elevation: 8,
                padding: EdgeInsets.all(0),
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Text(
                  i.toString(),
                  style: TextStyle(color: Colors.white),
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
