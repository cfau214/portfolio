import 'package:flutter/material.dart';

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

class CalcButtons extends StatelessWidget {
  var rowOne = <Buttons>[Buttons.seven, Buttons.eight, Buttons.nine];
  var rowTwo = <Buttons>[Buttons.four, Buttons.five, Buttons.six];
  var rowThree = <Buttons>[Buttons.one, Buttons.two, Buttons.three];
  var rowFour = <Buttons>[Buttons.delete, Buttons.zero, Buttons.calculate];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //...buildButtons(rowOne),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // List<Widget> buildButtons(List<Buttons> buttonList) {

  //   Widget buttons = buttonList


  //   return buttons;
  // }
}
