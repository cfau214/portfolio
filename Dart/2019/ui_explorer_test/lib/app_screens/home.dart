import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Testing Stateless UI Widgets'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Body());
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myWidget();
  }
}

Widget myWidget() {
  final _style = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  final leftColumn = Expanded(
    flex: 2,
    child: Container(
      margin: EdgeInsets.only(top: 16),
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Text('Home', style: _style),
            onTap: () => debugPrint('Tapped Home'),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          GestureDetector(
            child: Text('Contact', style: _style),
            onTap: () => debugPrint('Tapped Contact'),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          GestureDetector(
            child: Text('About', style: _style),
            onTap: () => debugPrint('Tapped About'),
          ),
        ],
      ),
    ),
  );

  final rightColumn = Expanded(
    flex: 7,
    child: Container(
      color: Colors.lightBlueAccent,
    ),
  );

  return Row(
    children: <Widget>[
      leftColumn,
      rightColumn,
    ],
  );
}
