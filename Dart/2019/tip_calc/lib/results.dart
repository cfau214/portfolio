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
    );
  }
}

class ServiceBody extends StatelessWidget {
  final _waitressPerformance = "How was your service today?";
  var _starRating = 0;

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
        ...starsMap.map((index) =>
          StarButton(index)  
        ).toList()
      ],
    );
  }
}

class StarButton extends StatefulWidget {
  StarButton(this._index);
  final _index;
  
  @override
  _StarButtonState createState() => _StarButtonState(_index);
}

class _StarButtonState extends State<StarButton> {
  _StarButtonState(this._index);
  
  bool isSelected = false;
  var _index;

  @override
  Widget build(BuildContext context) {
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
    // isSelected ? _starRating-- : _starRating++;
    // isSelected = !isSelected;
    print("New Star Rating: $_index");
  }
}
