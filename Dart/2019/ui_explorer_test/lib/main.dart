import 'package:flutter/material.dart';
import 'app_screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Testing UI Learned in Part 2 Tutorials",
      home: Home()  
    );
  }
}

// Widget myWidget() {
//   return Row(
//     children: <Widget>[
//       Expanded(
//         flex: 7,
//         child: Container(
//           color: Colors.green,
//         ),
//       ),
//       Expanded(
//         flex: 3,
//         child: Container(
//           color: Colors.yellow,
//         ),
//       ),
//     ],
//   );
// }
