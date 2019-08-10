import 'package:flutter/material.dart';
import 'package:tip_calc/calc_home.dart';

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
            child: Body(),
          ),
          // Bottom Bar
          BottomBar(),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
