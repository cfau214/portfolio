import 'package:flutter/material.dart';

/// buttons.dart contains an enumerated [Buttons] list and an associated [buttonMap] that 
/// provides labels or icons depending on each type of button.

/// Buttons Enum
///
/// Enumerator used for processing each button's action and label through a [buttonMap]
/// Used primarily in conjunction with each button action in [ButtonRow].
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

/// buttonMap
///
/// This map allows the label for a button to change based on it's enumerated [Buttons] type.
const buttonMap = <Buttons, dynamic>{
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
  Buttons.delete: Icon(Icons.backspace, size: 30),
  Buttons.calculate: Icon(Icons.arrow_right, size: 60)
};