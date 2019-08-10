import 'package:flutter/material.dart';
import 'calc_buttons.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final numFormatter = NumberFormat("##,###.##", "en_US");

class Amount with ChangeNotifier {
  Amount();

  num _amount = 0;
  num get getAmount => _amount;

  void addAmount(num amount) {
    if (_isUnderMaxLength()) {
      _amount *= 10;
      _amount += amount/100;
      notifyListeners();
    }  
  }

  void clear() {
    _amount = 0;
    notifyListeners();
  }

  _isUnderMaxLength() => _amount.toStringAsFixed(2).length < 8;
  
}

class CalcHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalcBody(),
    );
  }
}

class CalcBody extends StatefulWidget {
  @override
  _CalcBodyState createState() => _CalcBodyState();
}

// MAIN LAYOUT FUNCTION
class _CalcBodyState extends State<CalcBody> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Amount>(
      builder: (_) => Amount(),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TopBar(),
            ),
            Expanded(
              flex: 7,
              child: CalcButtons(),
            )
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amountState = Provider.of<Amount>(context);

    return Container(
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      padding: EdgeInsets.only(top: 80, left: 20, right: 12, bottom: 12),
      color: Colors.lightBlueAccent,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 80,
            child: Text(
              'Bill Amount:',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '\$${numFormatter.format(amountState.getAmount)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Expanded(flex: 1, child: Divider())
        ],
      ),
    );
  }
}
