import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _buttonRowOne = [7, 8, 9, '/'];
  final _buttonRowTwo = [4, 5, 6, '*'];
  final _buttonRowThree = [1, 2, 3, '-'];
  final _buttonRowFour = [0, '.', 'C', '+'];
  final _smallOperandButtons = ['/', '*', '-', '+'];
  var _lastClicked = "";

  num getOpacity(dynamic item) => (item is num && item == -1) ? 0.0 : 1.0;
  num getFlex(dynamic item) => (_smallOperandButtons.contains(item)) ? 2 : 3;
  Color getColor(dynamic item) => (item is num) ? Colors.black54 : Colors.red[700];

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
              flex: getFlex(item),
              child: Container(
                color: getColor(item),
                child: SizedBox(
                  height: 100,
                  child: OutlineButton(
                    highlightedBorderColor: Colors.grey[400],
                    child: Text(
                      item.toString(),
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey[400],
                      ),
                    ),
                    onPressed: () {
                      HapticFeedback.vibrate();
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


// color: Colors.black54,