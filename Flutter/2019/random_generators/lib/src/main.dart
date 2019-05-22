/*import 'package:flutter/material.dart';
//import 'package:random_generators/random_words/lib/random_words.dart';
import 'package:random_generators/random_numbers/lib/random_numbers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomNumbers(),
    );
  }
}*/

import 'package:flutter/material.dart';

/*void main() => runApp(new MaterialApp(
  home: AppHome(),
));

class AppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AppState();
  }
}

class AppState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: AppBar(
        title: new Text("My Test App"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new Card(
          child: new Text("Test"),

        )
      )
    );
  }
}*/

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Test Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new AppHome(),
    );
  }
}

class AppHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('My AppBar'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Container (
        child: new CircleAvatar(
          backgroundColor: Colors.blue,
        )
      )
    );
  }
}
