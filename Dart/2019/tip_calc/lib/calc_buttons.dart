import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'calc_home.dart';

enum Buttons {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  zero,
  delete,
  calculate
}

Amount amountState;

var buttonMap = <Buttons, dynamic>{
  Buttons.one: "1",
  Buttons.two: "2",
  Buttons.three: "3",
  Buttons.four: "4",
  Buttons.five: "5",
  Buttons.six: "6",
  Buttons.seven: "7",
  Buttons.eight: "8",
  Buttons.nine: "9",
  Buttons.zero: "0",
  Buttons.delete: Icon(Icons.backspace, size:30),
  Buttons.calculate: Icon(Icons.arrow_right, size: 60)
};

class CalcButtons extends StatelessWidget {
  final rowOne = <Buttons>[Buttons.seven, Buttons.eight, Buttons.nine];
  final rowTwo = <Buttons>[Buttons.four, Buttons.five, Buttons.six];
  final rowThree = <Buttons>[Buttons.one, Buttons.two, Buttons.three];
  final rowFour = <Buttons>[Buttons.delete, Buttons.zero, Buttons.calculate];

  @override
  Widget build(BuildContext context) {
    amountState = Provider.of<Amount>(context);

    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...buildButtons(rowOne),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...buildButtons(rowTwo),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...buildButtons(rowThree),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ...buildButtons(rowFour),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: Container(color: Colors.lightBlue),
        )
      ],
    );
  }

  List<Widget> buildButtons(List<Buttons> buttonList) {
    List<Widget> buttons = buttonList
        .map((button) => Expanded(
              flex: 1,
              child: OutlineButton(
                onPressed: () {
                  buttonAction(button);
                },
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
        .toList();

    return buttons;
  }

  buttonAction(Buttons button) {
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
        break;

      default:
        break;
    }
  }
}
