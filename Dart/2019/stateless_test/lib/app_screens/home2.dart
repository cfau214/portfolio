import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var _str = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(title: Text('Stateful 2 Testing')),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            TextField(
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            // BUTTONS
            buttonRow(),
            //
            Padding(padding: EdgeInsets.only(top: 50)),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: 300,
                height: 200,
                child: Center(
                  child: Text(
                    _str,
                    style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          elevation: 8,
          onPressed: () => {
            setState(() {
              _str = 'Button 1 Pressed';
            }),
          },
          color: Colors.lightBlueAccent,
          child: Text('Button 1'),
        ),
        RaisedButton(
          elevation: 8,
          onPressed: () => {
            setState(() {
              _str = 'Button 2 Pressed';
            }),
          },
          color: Colors.blue,
          child: Text('Button 2'),
        ),
      ],
    );
  }
}
