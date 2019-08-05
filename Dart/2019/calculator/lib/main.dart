import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
      title: 'Basic Calculator',
      home: CalcHome(),
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.only(left: 15, top: 2, right: 15, bottom: 2),
          colorScheme: ColorScheme.light(
            primary: Colors.grey[300],
          ),
        ),
      ),
    ));

class CalcHome extends StatefulWidget {
  @override
  _CalcHomeState createState() => _CalcHomeState();
}

class _CalcHomeState extends State<CalcHome> {
  final _numRowOne = [1, 2, 3];
  final _numRowTwo = [4, 5, 6];
  final _numRowThree = [7, 8, 9];
  final _numRowZero = [-1, 0, -1];

  final _minPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(_minPadding * 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ...createNumberRow(_numRowOne),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ...createNumberRow(_numRowTwo),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ...createNumberRow(_numRowThree),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
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
              constraints: BoxConstraints.expand(width: 60, height: 50),
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

  // Widget createNumberRow(List<num> list) {
  //   final _defaultOpacity = 1.0;

  //   num getOpacity(num number) {
  //     return number == -1 ? 0.0 : _defaultOpacity;
  //   }

  //   return  ButtonBar(
  //       children: list
  //           .map(
  //             (listItem) => Opacity(
  //               opacity: getOpacity(listItem),
  //               child: RaisedButton(
  //                 elevation: 4,
  //                 child: Text(listItem.toString()),
  //                 onPressed: () {
  //                   debugPrint(listItem.toString());
  //                 },
  //               ),
  //             ),
  //           )
  //           .toList(),
  //   );
  // }
}
