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
class AmountProvider with ChangeNotifier {
  AmountProvider();
  AmountProvider.withAmount(this.amount, {num tipPercent});

  var numFormatter = NumberFormat("###,##0.00", "en_US");

  num amount = 0.00;
  num tipPercent = 0.15;

  String get getAmountAsString => numFormatter.format(amount);
  num get calculateTip => amount * tipPercent;
  num get totalBill => amount += amount * tipPercent;

  _isUnderMaxLength() => amount.toStringAsFixed(2).length < 8;

  addAmount(num amt) {
    if (_isUnderMaxLength()) {
      amount *= 10;
      amount += amt / 100;
      notifyListeners();
    }
  }

  setTip(num newTipPerc) {
    // No negative tips!
    assert(newTipPerc >= 0, 'AmountProvider: setTip() - Warning: Negative Tip Percent $newTipPerc should not be less than 0');
    
    tipPercent = (newTipPerc == 0) ? 0 : newTipPerc / 100;
    notifyListeners();
  }

  clear() {
    amount = 0;
    notifyListeners();
  }
}
