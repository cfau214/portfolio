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

//TODO: 
// [x] - Create Navigator for this app.
// [x] - Create list of cocktails with images.
// [x] - Add cocktails to database.
// [x] - Retrieve all cocktails from database and display as text widget.
// [x] - Change display from text widget to actual widget with pictures.
// [x] - On press, do we want to open the cocktail in a new screen using a Hero widget?
// [x] - UI Design. Clean and simple. Listview or Gridview?
// [x] - Add cocktail app to app_manager project.