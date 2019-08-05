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
  final _buttonRowFour = ['+', 0, 'C'];

  var _lastClicked = "";

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
              child: Container(
                padding: EdgeInsets.all(50),
                alignment: Alignment.topRight,
                child: Text(
                  _lastClicked,
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 32,
                  ),
                ),
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
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (item.toString().toUpperCase() == 'C') {
                        _lastClicked = "";
                      } else {
                        _lastClicked += item.toString();
                      }
                    });
                  },
                  child: Container(
                    height: 90,
                    child: Center(
                      child: Text(
                        item.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: item == '.' ? 36 : 24),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.black38,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
