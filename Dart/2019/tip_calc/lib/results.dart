import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calc/calc_home.dart';

import 'star_manager.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResultsBody());
  }
}

class ResultsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<StarManager>(
        builder: (_) => StarManager(),
        child: Column(
          children: <Widget>[
            // Top Bar
            Expanded(
              flex: 3,
              child: TopBar(),
            ),
            // Calculator Buttons
            Expanded(
              flex: 2,
              child: ServiceBody(),
            ),
            // Divider
            Expanded(
              flex: 7,
              child: Divider(),
            ),
            // Bottom Bar
            BottomBar(),
          ],
        ),
      ),
    );
  }
}

class ServiceBody extends StatelessWidget {
  final _waitressPerformance = "How was your service today?";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Text(_waitressPerformance),
          ),
          Expanded(
            flex: 6,
            child: StarButtonList(),
          ),
        ],
      ),
    );
  }
}

class StarButtonList extends StatefulWidget {
  @override
  _StarButtonListState createState() => _StarButtonListState();
}

class _StarButtonListState extends State<StarButtonList> {
  StarManager starProvider;

  @override
  Widget build(BuildContext context) {
    starProvider = Provider.of<StarManager>(context);

    return Row(
      children: <Widget>[
        ...createStarList(starProvider.starList)
      ],
    );
  }

  List<Widget> createStarList(List<Star> list) {
    return list.map((star) => 
      GestureDetector(
        child: star.icon,
        onTap: () { 
          starProvider.toggleStar(star);
        }
      )
    ).toList();
  }
}
