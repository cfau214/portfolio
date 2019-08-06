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
              child: Card(
                color: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(32, 12),
                    topRight: Radius.elliptical(32, 12),
                    bottomLeft: Radius.elliptical(32, 4),
                    bottomRight: Radius.elliptical(32, 4),
                  ),
                ),
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
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
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
              child: Container(
                color: Colors.black54,
                child: SizedBox(
                  height: 85,
                  child: OutlineButton(
                    child: Text(item.toString(),
                        style: TextStyle(
                          color: Colors.grey[400],
                        )),
                    onPressed: () {
                      setState(() {
                        if (item.toString().toUpperCase() == 'C') {
                          _lastClicked = "";
                        } else {
                          _lastClicked += item.toString();
                        }
                      });
                    },
                    shape: Border.all(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ))
        .toList();
  }
}
