import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calc/calc_home.dart';

import 'star_manager.dart';

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
  final _waitressPerformance = "How was your service today?";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Text(_waitressPerformance),
          ),
          SizedBox(width: 5),
          Expanded(
            flex: 4,
            child: StarButtonList(),
          ),
        ],
      ),
    );
  }
}

class StarButtonList extends StatelessWidget {
  final starsMap = Iterable<int>.generate(5, (i) => i++);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ...starsMap
            .map(
              (index) => StarButton(index),
            )
            .toList()
      ],
    );
  }
}

class StarButton extends StatefulWidget {
  StarButton(this._index);

  final int _index;

  @override
  _StarButtonState createState() => _StarButtonState(_index);
}

class _StarButtonState extends State<StarButton> {
  _StarButtonState(this._index);

  num _index;
  bool isSelected = false;

  StarManager starProvider;

  @override
  Widget build(BuildContext context) {
    starProvider = Provider.of<StarManager>(context);
    isSelected = _index <= starProvider.getStars;

    return GestureDetector(
      child: Icon(
        isSelected ? Icons.star : Icons.star_border,
        color: Colors.yellow,
        size: 30,
      ),
      onTap: () {
        setState(() {
          toggle();
        });
      },
    );
  }

  toggle() {
    isSelected ? starProvider.removeStars(_index) : starProvider.addStars(_index);
    isSelected = !isSelected;
  }
}
