import 'package:flutter/material.dart';

void main() => runApp(Calc2());

class Calc2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator 2',
      home: Calc2Body(),
    );
  }
}

class Calc2Body extends StatefulWidget {
  @override
  _Calc2BodyState createState() => _Calc2BodyState();
}

class _Calc2BodyState extends State<Calc2Body> {
  final _buttonRowOne = [7, 8, 9];
  final _buttonRowTwo = [4, 5, 6];
  final _buttonRowThree = [1, 2, 3];
  final _buttonRowFour = ['+/-', 0, '.'];

  num getOpacity(dynamic item) => (item is num && item == -1) ? 0.0 : 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
        title: Text('Calculator 2'),
      ),
      body: Container(
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text('Test'),
              ),
            ),
            Row(
              children: <Widget>[
                ...buildButtonRow(_buttonRowOne),
              ],
            ),
            Row(
              children: <Widget>[
                ...buildButtonRow(_buttonRowTwo),
              ],
            ),
            Row(
              children: <Widget>[
                ...buildButtonRow(_buttonRowThree),
              ],
            ),
            Row(
              children: <Widget>[
                ...buildButtonRow(_buttonRowFour),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildButtonRow(List<dynamic> list) {
    return list
        .map((item) => Expanded(
              child: Opacity(
                opacity: getOpacity(item),
                child: Container(
                  height: 80,
                  child: Center(
                    child: Text(
                      item.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(
                      color: Colors.black38,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
