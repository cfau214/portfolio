import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

/// StarManager is used to track the state of each [Star] in the star rating system.
///
/// On first initialization, a default of 5 Stars are created and added to the [starList].
/// As a specific star is toggled, the manager will toggle that star and all of it's preceding stars
/// similarly,
///
///   eg. When the user clicks the 3rd star in the list, the first and second stars will be toggled
///   to match the status of the 3rd star.
///
/// * [starRating] - Returns the number of stars currently selected by the user.
/// * [starList] - List of stars being tracked by the manager.
///
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

    // If the user selects a star that precedes the currently selected stars,
    // only change the status of stars that come AFTER the new star.
    if (index < starRating - 1) {
      for (int i = index + 1; i < starList.length; i++) {
        starList[i].isSelected = false;
      }
    } else {
      starList[index].toggle();

      // Change the status of all stars preceding tempStar to match tempStar's new status.
      for (int i = 0; i < index; i++) {
        starList[i].isSelected = starList[index].isSelected;
      }
    }

    notifyListeners();
  }
}

/// Star is used in the [StarManager] as a way to track user's service satisfaction.
///
/// The star can return an [icon] representing the current status that shows a different
/// icon depending on if the star [isSelected].
///
class Star {
  Star(this.index) {}

  int index;
  bool isSelected = false;
  Color iconColor = Colors.yellow[600];

  Icon get icon => Icon(
        isSelected ? Icons.star : Icons.star_border,
        color: iconColor,
        size: 40,
      );

  toggle() {
    isSelected = !isSelected;
  }
}
