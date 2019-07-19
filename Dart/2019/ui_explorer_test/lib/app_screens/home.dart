import 'package:flutter/material.dart';

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
    return Center(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.landscape),
            title: Text('The Landscape Tile'),
            subtitle: Text('The mountains...'),
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text('The PC'),
            subtitle: Text('Time to build a new one!'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home icon'),
            subtitle: Text('Generic subtitle'),
          ),
          BodyContent(),
        ],
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(16.0),
        child: Text('Center of Body'),
        alignment: Alignment(0,0),
      ),
    );
  }
}
