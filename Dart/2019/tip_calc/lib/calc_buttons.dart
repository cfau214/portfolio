import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'results.dart';
import 'amount_provider.dart';
import 'buttons.dart';

/// CalcButtons creates the layout for the calculator.
///
/// * [rowOne] - Buttons 7-9
/// * [rowTwo] - Buttons 4-6
/// * [rowThree] - Buttons 1-3
/// * [rowFour] - Buttons delete, 0, calculate
///
/// Each button pressed will perform a different [buttonAction]
///
class CalcButtons extends StatelessWidget {
  final rowOne = <Buttons>[Buttons.seven, Buttons.eight, Buttons.nine];
  final rowTwo = <Buttons>[Buttons.four, Buttons.five, Buttons.six];
  final rowThree = <Buttons>[Buttons.one, Buttons.two, Buttons.three];
  final rowFour = <Buttons>[Buttons.delete, Buttons.zero, Buttons.calculate];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonRow(row: rowOne),
        ButtonRow(row: rowTwo),
        ButtonRow(row: rowThree),
        ButtonRow(row: rowFour),
      ],
    );
  }
}

/// ButtonRow creates a spreadable row of pressable buttons based on a [Buttons] enumerated list
/// that is passed as the required [row].
///
class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key key,
    @required this.row,
  }) : super(key: key);

  final List<Buttons> row;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...row
                .map((button) => Expanded(
                      flex: 1,
                      child: OutlineButton(
                        onPressed: () {
                          buttonAction(button, context);
                        },

                        /// The type of child will change based on the button pressed.
                        child: (buttonMap[button] is String)
                            ? Text(
                                buttonMap[button],
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : buttonMap[button],
                      ),
                    ))
                .toList(),
          ]),
    );
  }

  /// buttonAction
  ///
  /// Performs a different action based on the [Buttons] pressed.
  ///
  buttonAction(Buttons button, BuildContext context) {
    var amountState = Provider.of<AmountProvider>(context);

    switch (button) {
      case Buttons.one:
        amountState.addAmount(1);
        break;

      case Buttons.two:
        amountState.addAmount(2);
        break;

      case Buttons.three:
        amountState.addAmount(3);
        break;

      case Buttons.four:
        amountState.addAmount(4);
        break;

      case Buttons.five:
        amountState.addAmount(5);
        break;

      case Buttons.six:
        amountState.addAmount(6);
        break;

      case Buttons.seven:
        amountState.addAmount(7);
        break;

      case Buttons.eight:
        amountState.addAmount(8);
        break;

      case Buttons.nine:
        amountState.addAmount(9);
        break;

      case Buttons.zero:
        amountState.addAmount(0);
        break;

      case Buttons.delete:
        amountState.clear();
        break;

      case Buttons.calculate:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Results(),
          ),
        );
        break;

      default:
        break;
    }
  }
}
