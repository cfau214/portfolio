import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget Testing'),
        ),
        body: TF());
  }
}

class TF extends StatefulWidget {
  @override
  _TFState createState() => _TFState();
}

class _TFState extends State<TF> {
  var text = "";
  var list = <String>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: TextField(
                onChanged: (String input) {
                  text = input;
                },
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => {
            debugPrint('Tapped Card'),
            if (text != '') list.add(text),
            debugPrint("$list"),
            setState(() {

            })
          },
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 8.0,
            child: Container(
              width: 200,
              height: 50,
              child: Center(
                child: Text(
                  'Add Item',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),

        for (String item in list) Container( child: ListTile(title: Text(item)))

      ],
    );
  }

  addItem() {
    list.add(text);
  }
}
