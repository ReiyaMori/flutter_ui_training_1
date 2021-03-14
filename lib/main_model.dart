import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class MainModel with ChangeNotifier {
  int selectedIndex = 0;

  void selected(index) {
    selectedIndex = index;
    notifyListeners();
  }

  ScrollController scrollViewController = new ScrollController();

  bool showAppbar = true;
  bool isScrollingDown = false;

  void isScroll(){
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          showAppbar = false;
          notifyListeners();
        }
      }

      if (scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showAppbar = true;
          notifyListeners();
        }
      }
    });
  }

}