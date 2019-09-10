import 'package:flutter/material.dart';
import 'package:cocktails/screens/cocktails_home.dart';

main() => runApp(CocktailsApp());

class CocktailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail Browser',
      home: CocktailsHome(),
    );
  }
}
