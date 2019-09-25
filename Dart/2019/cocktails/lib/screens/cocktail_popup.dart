import 'package:flutter/material.dart';

class CocktailPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CocktailPopupBody(),
    );
  }
}

class CocktailPopupBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Test'),
      ],
    );
  }
}
