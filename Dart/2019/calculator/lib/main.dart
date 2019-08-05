import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      title: 'Basic Calculator',
      home: CalcHome(),
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          minWidth: double.maxFinite,
          padding: EdgeInsets.all(1),
          colorScheme: ColorScheme.light(
            primary: Colors.grey[300],
          ),
          hoverColor: Colors.lightBlueAccent,
          layoutBehavior: ButtonBarLayoutBehavior.constrained,
        ),
      ),
    ));

class CalcHome extends StatefulWidget {
  @override
  _CalcHomeState createState() => _CalcHomeState();
}

class _CalcHomeState extends State<CalcHome> {
  final _numRowOne = [9, 8, 7];
  final _numRowTwo = [6, 5, 4];
  final _numRowThree = [3, 2, 1];
  final _numRowZero = [-1, 0, -1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Divider(height: 200),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ...createNumberRow(_numRowOne),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ...createNumberRow(_numRowTwo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ...createNumberRow(_numRowThree),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ...createNumberRow(_numRowZero),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createNumberRow(List<num> list) {
    final _defaultOpacity = 1.0;

    num getOpacity(num number) {
      return number == -1 ? 0.0 : _defaultOpacity;
    }

    return list
        .map((listItem) => ConstrainedBox(
              constraints: BoxConstraints.expand(width: 100, height: 80),
              child: Opacity(
                opacity: getOpacity(listItem),
                child: RaisedButton(
                  elevation: 4,
                  child: Text(listItem.toString()),
                  onPressed: () {
                    debugPrint(listItem.toString());
                  },
                ),
              ),
            ))
        .toList();
  }
}
