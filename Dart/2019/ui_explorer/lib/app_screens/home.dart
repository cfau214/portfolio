import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Index List')),
      body: Body(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.landscape),
          onPressed: () {
            debugPrint("+ Pressed");
          }),
    );
  }
}

class Body extends StatelessWidget {
  final list = <int, String>{1: "Apples", 2: "Oranges", 3: "Bananas"};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Column(
          children: <Widget>[
            for (var index in list.keys) createListRow(index, list[index]),
            ListButton()
          ],
        ),
      ),
    );
  }

  Widget createListRow(int index, String item) {
    var _style = TextStyle(
      fontSize: 18,
      color: Colors.black,
    );

    return Row(
      children: <Widget>[
        Text('$index:  ', style: _style),
        Expanded(
          child: Text('$item', style: _style),
        )
      ],
    );
  }
}

class ListButton extends StatelessWidget {
  final rectBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250,
        height: 50,
        child: RaisedButton(
          shape: rectBorder,
          color: Colors.lightBlueAccent,
          child: Text(
            "Generate New List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
          onPressed: () => createAlert(context),
        ));
  }

  createAlert(BuildContext context) {
    var dialog = AlertDialog(
        title: Text(
          'New List Generated',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                    shape: rectBorder,
                    child: Text('Ok', style: TextStyle(color: Colors.white)),
                    color: Colors.lightBlueAccent,
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          ],
        ));

    showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }
}
