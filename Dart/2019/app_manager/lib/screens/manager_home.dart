import 'package:flutter/material.dart';

import 'package:app_manager/shared_widgets/app_bar.dart';
import 'package:app_manager/navigator.dart';

//TODO:
// [x] - Update Tip calculator to use new appBar
// [x] - Fix overflow issues on tip calc.
// [x] - Add calculator app?
// [x] - Make more apps!!
// [x] - Cocktails app -> Change appBar to use shared appBar after moving to this project.

class ManagerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: namedAppBar('App Manager', context),
      body: ManagerHomeBody(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Test Header'),
            ),
            ListTile(title: Text('Test Title')),
          ],
        ),
      ),
    );
  }
}

class ManagerHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(20),
      children: <Widget>[
        GridTile(
          child: IconButton(
            tooltip: 'Tip Calculator',
            icon: Icon(
              Icons.payment,
              color: Colors.lightGreen,
            ),
            iconSize: 70,
            onPressed: () {
              Navigator.pushNamed(context, MyNavigator.tipCalculator);
            },
          ),
        ),
      ],
    );
  }
}
