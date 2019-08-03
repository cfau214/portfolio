import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      title: 'Basic Calculator',
      home: CalcHome(),
    ));

class CalcHome extends StatefulWidget {
  @override
  _CalcHomeState createState() => _CalcHomeState();
}

class _CalcHomeState extends State<CalcHome> {
  final _numRowOne = [1, 2, 3];
  final _numRowTwo = [4, 5, 6];
  final _numRowThree = [7, 8, 9];
  final _numRowZero = [null, 0, null];

  final _minPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(_minPadding * 10),
        child: Column(
          children: <Widget>[
            createNumberRow(_numRowOne),
            createNumberRow(_numRowTwo),
            createNumberRow(_numRowThree),
            createNumberRow(_numRowZero),
          ],
        ),
      ),
    );
  }

  Widget createNumberRow(List<num> list) {
    return Row(
      children: list
          .map((listItem) => Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _minPadding,
                    bottom: _minPadding,
                    left: _minPadding * 2,
                    right: _minPadding * 2),
                child: RaisedButton(
                  child: Text(listItem.toString()),
                  onPressed: () {
                    debugPrint(listItem.toString());
                  },
                ),
              )))
          .toList(),
    );
  }
}
