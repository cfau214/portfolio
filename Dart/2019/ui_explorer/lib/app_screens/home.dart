import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  var _display = "Display Default";
  var _basicStyle = TextStyle(color: Colors.blue, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Material (
      color: Colors.lightBlue[300],
      child: Center (
        child: Container (
          color: Colors.white,
          padding: EdgeInsets.all(25.0),
          alignment: Alignment.topLeft,
          child: Text(_display, style: _basicStyle)
        )
      )
    );
  }  
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('Home Screen'),
      ),
      body: Body()
    );
  }  
}