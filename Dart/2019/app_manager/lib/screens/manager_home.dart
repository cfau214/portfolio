import 'package:flutter/material.dart';
import 'package:app_manager/shared_widgets/app_bar.dart';

//TODO:
// [x] - Update Tip calculator to use new appBar
// [x] - Fix overflow issues on tip calc.
// [x] - Add Switch widget for dynamic theme
// [x] - Custom appBar with Drawer that can be added to all new apps.

class ManagerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _drawerStyle = TextStyle(color: Colors.black);

    return Scaffold(
      appBar: namedAppBar('App Manager'),
      body: ManagerHomeBody(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Test Header', style: _drawerStyle),
            ),
            ListTile(title: Text('Test Title', style: _drawerStyle)),
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
              Navigator.pushNamed(context, '/tipCalculator');
            },
          ),
        ),
      ],
    );
  }
}
