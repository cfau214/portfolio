import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class StarManager with ChangeNotifier {
  StarManager();

  static List<Star> starList = <Star>[];

  int _totalStars = starList.length;
  num get getStars => _totalStars;

  addStars(int increase) {
    _totalStars += increase;
  }

  removeStars(int decrease) {
    _totalStars -= decrease;
  }

  init() {
    starList.addAll(
      List.filled(5, Star()),
    );
  }
}

class Star {
  static final Color iconColor = Colors.yellow;

  bool isSelected = false;
  Icon _isSelectedIcon = Icon(Icons.star, color: iconColor);
  Icon _isNotSelectedIcon = Icon(Icons.star_border);

  Icon get getIcon => isSelected ? _isSelectedIcon : _isNotSelectedIcon;
  Color get getColor => iconColor;

  toggle() {
    isSelected = !isSelected;
  }
}
