import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
};

class CalcButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return calcButtons();
  }
}

Widget calcButtons() {
  final rowOne = <Buttons>[Buttons.seven, Buttons.eight, Buttons.nine];
  final rowTwo = <Buttons>[Buttons.four, Buttons.five, Buttons.six];
  final rowThree = <Buttons>[Buttons.one, Buttons.two, Buttons.three];
  final rowFour = <Buttons>[Buttons.delete, Buttons.zero, Buttons.calculate];

  return Column(
    children: <Widget>[
      Expanded(
        child: Row(
          children: <Widget>[
            ...buildButtons(rowOne),
          ],
        ),
      ),
      Expanded(
        child: Row(
          children: <Widget>[
            ...buildButtons(rowTwo),
          ],
        ),
      ),
      Expanded(
        child: Row(
          children: <Widget>[
            ...buildButtons(rowThree),
          ],
        ),
      ),
    ],
  );
}

List<Widget> buildButtons(List<Buttons> buttonList) {
  List<Widget> buttons = buttonList
      .map((button) => Expanded(
            flex: 1,
            child: Center(
              //TODO: Fix this, look at outline and have the buttons expand properly.
              child: OutlineButton(
                onPressed: () {},
                child: Text(
                  buttonMap[button],
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ))
      .toList();

  return buttons;
}
