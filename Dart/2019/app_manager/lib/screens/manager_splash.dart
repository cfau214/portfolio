import 'package:flutter/material.dart';

class ManagerSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            elevation: 8,
            child: Icon(
              Icons.home,
              size: 100,
              color: Colors.white,
            ),
            onPressed: () => {
                  Navigator.pushReplacementNamed(context, '/home'),
                }),
      ),
    );
  }
}
