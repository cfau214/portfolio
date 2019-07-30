import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var _boxList = <String>[];
  final _textControllerOne = TextEditingController();

  @override
  void dispose() {
    _textControllerOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              controller: _textControllerOne,
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
                    _boxList.isEmpty ? "" : _boxList.join("\n"),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: () => {
            setState(() {
              addItem(context);
            }),
          },
          color: Colors.lightBlueAccent,
          child: Text('Add'),
        ),
        RaisedButton(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: () => {
            setState(() {
              removeItem();
            }),
          },
          color: Colors.blue,
          child: Text('Remove'),
        ),
      ],
    );
  }

  addItem(BuildContext context) {
    if (_textControllerOne.text == "") {
      showDialog(
        context: context,
        child: AlertDialog(
          content: Text("Text Field 1 is empty."),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      _boxList.add(_textControllerOne.text);
      _textControllerOne.text = "";
    }
  }

  removeItem() {
    if (_boxList.isNotEmpty) _boxList.removeLast();
  }
}
