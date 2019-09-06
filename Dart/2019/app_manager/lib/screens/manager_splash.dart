import 'package:flutter/material.dart';
import 'package:app_manager/shared_widgets/app_bar.dart';

class ManagerSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: Center(
        child: RaisedButton(
            elevation: 8,
            child: Icon(
              Icons.home,
              size: 100,
              color: Colors.white,
            ),
            onPressed: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/home'),
                }),
      ),
    );
  }
}
