import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Amount
///
/// This class is a provider that allows outside widgets to access and modify [_amount].
/// 
///
/// * [_amount] - The tip amount entered.
/// * [getAmount] - Returns the current amount entered.
/// * [getAmountAsString] - Returns current amount parsed as a formatted string.
///
/// * [addAmount] - Appends the last button pressed to the end of current amount and shifts the decimal one place.
/// * [clear] - Resets the tip amount back to 0.
///
/// * [_isUnderMaxLength] - Controls the number of digits the user can enter. Currently only allows a number of length ##,###.##.
///
class Amount with ChangeNotifier {
  Amount();
  Amount.withAmount(this._amount);

  var numFormatter = NumberFormat("###,###.##", "en_US");

  num _amount = 0;
  num get getAmount => _amount;
  String get getAmountAsString => numFormatter.format(_amount);

  void addAmount(num amount) {
    if (_isUnderMaxLength()) {
      _amount *= 10;
      _amount += amount / 100;
      notifyListeners();
    }
  }

  void clear() {
    _amount = 0;
    notifyListeners();
  }

  _isUnderMaxLength() => _amount.toStringAsFixed(2).length < 8;
}