import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class StarManager with ChangeNotifier {
  StarManager() {
    _init();
  }
  _init() {
    for (int i = 0; i < 5; i++) {
      starList.add(Star(i));
    }
  }

  List<Star> starList = <Star>[];

  int get starRating => starList.where((star) => star.isSelected).length;

  toggleStar(Star tempStar) {
    var index = tempStar.index;

    starList[index].toggle();

    for (int i = 0; i < index; i++) {
      starList[i].isSelected = starList[index].isSelected;
    }

    notifyListeners();
  }
}

class Star {
  Star(this.index);

  int index;
  bool isSelected = false;
  Color iconColor = Colors.yellow;

  Icon get icon => Icon(
        isSelected ? Icons.star : Icons.star_border,
        color: iconColor,
        size: 30,
      );

  toggle() {
    isSelected = !isSelected;
  }
}
