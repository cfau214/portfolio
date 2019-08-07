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
  String _leftHandSide = "";
  String _rightHandSide = "";
  String _operand = "";
  String _operandEquals = "";
  String _result = "";
  bool _hasLHSDecimal = false;
  bool _hasRHSDecimal = false;

  num getOpacity(dynamic item) => (item is num && item == -1) ? 0.0 : 1.0;
  num getFlex(dynamic item) => (_smallOperandButtons.contains(item)) ? 2 : 4;

  /// Returns Button Color.
  ///
  /// * [ret], The color returned to calling button.
  Color getColor(dynamic item) {
    Color ret; // Button color.

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
                    // OPERAND DISPLAYS
                    Column(
                      // OPERAND
                      children: <Widget>[
                        // EMPTY SPACER BOX
                        Expanded(
                          child: Divider(),
                        ),
                        Expanded(
                          child: Container(
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
                        ),
                        // EQUALS
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 50),
                            alignment: Alignment.center,
                            child: Text(
                              _operandEquals,
                              style: TextStyle(
                                color: Colors.yellow[200],
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        // LHS DISPLAY
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 50),
                            alignment: Alignment.centerRight,
                            child: Text(
                              _leftHandSide,
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                        // RHS DISPLAY
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 50),
                            alignment: Alignment.centerRight,
                            child: Text(
                              _rightHandSide,
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                        // RESULT DISPLAY
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 50),
                            alignment: Alignment.centerRight,
                            child: Text(
                              _result,
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 32,
                              ),
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
      _rightHandSide = "";
      _operand = "";
      _operandEquals = "";
      _result = "";
      _hasLHSDecimal = false;
      _hasRHSDecimal = false;
    }

    setOperand(String op) {
      if (_leftHandSide.isNotEmpty) _operand = op;
    }

    validateFields() {
      if (_leftHandSide.isNotEmpty &&
          _operand.isNotEmpty &&
          _rightHandSide.isNotEmpty) {
        _operandEquals = "=";
        return true;
      }
    }

    calculate() {
      num _lhs = num.tryParse(_leftHandSide);
      num _rhs = num.tryParse(_rightHandSide);

      if (_lhs != null && _rhs != null) {
        num result;

        switch (_operand) {
          case '/':
            result = _lhs / _rhs;
            break;

          case '*':
            result = _lhs * _rhs;
            break;

          case '-':
            result = _lhs - _rhs;
            break;

          case '+':
            result = _lhs + _rhs;
            break;

          default:
            break;
        }

        _result = result.toString();
      }
    }

    handleNumPress(dynamic buttonPressed) {
      // LHS
      if (_operand.isEmpty) {
        if (buttonPressed == '.') {
          if (!_hasLHSDecimal) {
            _leftHandSide += buttonPressed.toString();
          }
          _hasLHSDecimal = true;
        } else {
          _leftHandSide += buttonPressed.toString();
        }
      }
      // RHS
      else {
        if (buttonPressed == '.') {
          if (!_hasRHSDecimal) {
            _rightHandSide += buttonPressed.toString();
          }
          _hasRHSDecimal = true;
        } else {
          _rightHandSide += buttonPressed.toString();
        }
      }
    }

    processButtonAction(dynamic item) {
      if (_result.isNotEmpty) {
        reset();
      }
      if (item is String) {
        switch (item) {
          case 'C':
            reset();
            break;

          case '.':
            handleNumPress(item);
            break;

          case '=':
            if (validateFields()) {
              calculate();
            }
            break;

          default:
            setOperand(item);
            break;
        }
      }
      // Item is num
      else {
        handleNumPress(item);
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
