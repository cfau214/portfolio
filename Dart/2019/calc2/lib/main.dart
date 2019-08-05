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
  final _buttonRowOne = [9, 8, 7];
  final _buttonRowTwo = [6, 5, 4];
  final _buttonRowThree = [3, 2, 1];
  final _buttonRowFour = [-1, 0, -1];

  num getOpacity(num item) => item == -1 ? 0.0 : 1.0;

  List<Widget> buildButtonRow(List<num> list) {
    return list
        .map((item) => Opacity(
          opacity: getOpacity(item),
                  child: Expanded(
                child: RaisedButton(
                  onPressed: () {
                    debugPrint(item.toString());
                  },
                  child: Text(item.toString()),
                ),
              ),
        ))
        .toList();
  }

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
          children: <Widget>[
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
}
