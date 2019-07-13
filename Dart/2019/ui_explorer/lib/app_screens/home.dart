import 'package:flutter/material.dart';

// class Body extends StatelessWidget {
//   var _display = "Display Default";
//   var _basicStyle = TextStyle(color: Colors.blue, fontSize: 20);

//   @override
//   Widget build(BuildContext context) {
//     return Material (
//       color: Colors.lightBlue[300],
//       child: Center (
//         child: Container (
//           color: Colors.white,
//           padding: EdgeInsets.all(25.0),
//           alignment: Alignment.topLeft,
//           child: Text(_display, style: _basicStyle)
//         )
//       )
//     );
//   }  
// }

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text('Index List'),
      ),
      body: Body()
    );
  }  
}

class Body extends StatelessWidget {
  var _basicStyle = TextStyle(color: Colors.blue, fontSize: 20);
  var list = <int, String>{
    1: "Apples",
    2: "Oranges",
    3: "Bananas"
  };

  @override
  Widget build(BuildContext context) {
    return Material (      
      child: Container (
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Column (
          children: <Widget>[
            for (var index in list.keys) createListRow(index, list[index])
          ],
        )
      )
    );
  }

  Row createListRow(int index, String item) {
    var numberStyle = TextStyle(fontSize: 18, color: Colors.black);
    var textStyle = TextStyle(fontSize: 18, color: Colors.black);

    return Row (
      children: <Widget>[
        Text('$index:  ', style: numberStyle),
        Expanded(child: Text('$item', style: textStyle))
      ],
    );
  }
}