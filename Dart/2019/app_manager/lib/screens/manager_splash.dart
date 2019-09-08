import 'package:flutter/material.dart';

class ManagerSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          icon: Icon(Icons.home),
          iconSize: 100,
          onPressed: () => {
            Navigator.pushNamed(context, '/home'),
          },
        ),
      ),
    );
  }
}
