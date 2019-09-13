import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cocktails/database/record.dart';

//TODO:
// [x] - Store images on cloud.
// [x] - Get images from cloud and use them in app.
// [x] - On tap of each cocktail, move to new detailed screen that has more detailed info, such as measurements and instructions.
// [x] - Home should have grid of pictures with cocktail name only. Description on detailed page.
// [x] - Can we design with Hero transition in mind?

class CocktailsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cocktail Browser'),
        centerTitle: true,
      ),
      body: CocktailsBody(),
    );
  }
}

class CocktailsBody extends StatefulWidget {
  @override
  _CocktailsBodyState createState() => _CocktailsBodyState();
}

class _CocktailsBodyState extends State<CocktailsBody> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('cocktails').snapshots(),
      builder: (context, snapshot) {
        // If snapshot does not have any data, show progress bar. Otherwise show grid view with list of cocktails.
        return !snapshot.hasData
            ? LinearProgressIndicator()
            : _buildGridView(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildGridView(
      BuildContext context, List<DocumentSnapshot> snapshots) {
    return GridView.count(
      crossAxisCount: 3,
      padding: EdgeInsets.all(10),
      children: snapshots.map((data) => _buildGridItem(context, data)).toList(),
    );
  }

  Widget _buildGridItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return GridTile(child: Text(record.toString()));
  }
}