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
  final _buttonRowFour = [0, '.', 'C', '=', '+'];
  final _smallOperandButtons = ['/', '*', '-', '+', 'C', '='];
  var _leftHandSide = "";
  var _operand = "";
  var _result = "";
  var _hasDecimal = false;

  num getOpacity(dynamic item) => (item is num && item == -1) ? 0.0 : 1.0;
  num getFlex(dynamic item) => (_smallOperandButtons.contains(item)) ? 2 : 4;
  Color getColor(dynamic item) {
    Color ret;

    if (item == 'C') {
      ret = Colors.grey[700];
    } else if (item == '=') {
      ret = Colors.yellow[500];
    } else {
      (item is num || item == '.')
          ? ret = Colors.black54
          : ret = Colors.red[700];
    }

    return ret;
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // DISPLAY
            Expanded(
              child: Card(
                color: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(32, 12),
                    topRight: Radius.elliptical(32, 12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // OPERAND BOX
                    Container(
                      padding: EdgeInsets.only(right: 50),
                      alignment: Alignment.center,
                      child: Text(
                        _operand,
                        style: TextStyle(
                          color: Colors.yellow[200],
                          fontSize: 32,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 50, top: 20),
                          alignment: Alignment.topRight,
                          child: Text(
                            _leftHandSide,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 50, top: 20),
                          alignment: Alignment.topRight,
                          child: Text(
                            _leftHandSide,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 50, top: 20),
                          alignment: Alignment.topRight,
                          child: Text(
                            _leftHandSide,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // BUTTONS
            Row(
              children: <Widget>[
                // 7-9
                ...buildButtonRow(_buttonRowOne),
              ],
            ),
            Row(
              children: <Widget>[
                // 4-6
                ...buildButtonRow(_buttonRowTwo),
              ],
            ),
            Row(
              children: <Widget>[
                // 1-3
                ...buildButtonRow(_buttonRowThree),
              ],
            ),
            Row(
              children: <Widget>[
                // 0
                ...buildButtonRow(_buttonRowFour),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildButtonRow(List<dynamic> list) {
    reset() {
      _leftHandSide = "";
      _operand = "";
      _result = "";
      _hasDecimal = false;
    }

    setOperand(String op) {
      _operand = op;
    }

    getResult() {}

    processButtonAction(dynamic item) {
      if (item is String) {
        switch (item) {
          case 'C':
            reset();
            break;

          case '.':
            if (!_hasDecimal) {
              _leftHandSide += item;
              _hasDecimal = true;
            }
            break;

          case '=':
            getResult();
            break;

          default:
            setOperand(item);
            break;
        }
      }
      // Item is num
      else {
        _leftHandSide += item.toString();
      }
    }

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
                        processButtonAction(item);
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
