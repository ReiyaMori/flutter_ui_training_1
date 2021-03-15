import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  List postsData = [
    {
      'name': 'Pean',
      'message':'Weak reason. No action required.',
      'textReason':'Report Details',
      'colorPrimary':Colors.greenAccent,
      'colorPositive':Colors.greenAccent,
      'textPositive':'Keep',
      'colorNegative': Colors.blueAccent,
      'textNegative': 'Archive',
    },
    {
      'name': 'Namaga Tema',
      'message': 'Not recomended for publication.',
      'textReason': 'Pending Reason',
      'colorPrimary': Colors.deepOrangeAccent,
      'colorPositive': Colors.blueAccent,
      'textPositive': 'Publish',
      'colorNegative': Colors.deepOrangeAccent,
      'textNegative': 'Decline',
    },
    {
      'name': 'Mr.Bean',
      'message':'Weak reason. No action required.',
      'textReason':'Report Details',
      'colorPrimary':Colors.greenAccent,
      'colorPositive':Colors.greenAccent,
      'textPositive':'Keep',
      'colorNegative': Colors.blueAccent,
      'textNegative': 'Archive',
    },
    {
      'name': 'Yujo!!',
      'message': 'Not recomended for publication.',
      'textReason': 'Pending Reason',
      'colorPrimary': Colors.deepOrangeAccent,
      'colorPositive': Colors.blueAccent,
      'textPositive': 'Publish',
      'colorNegative': Colors.deepOrangeAccent,
      'textNegative': 'Decline',
    },
    {
      'name': 'Breave',
      'message':'Weak reason. No action required.',
      'textReason':'Report Details',
      'colorPrimary':Colors.greenAccent,
      'colorPositive':Colors.greenAccent,
      'textPositive':'Keep',
      'colorNegative': Colors.blueAccent,
      'textNegative': 'Archive',
    },
    {
      'name': 'RunRun',
      'message': 'Not recomended for publication.',
      'textReason': 'Pending Reason',
      'colorPrimary': Colors.deepOrangeAccent,
      'colorPositive': Colors.blueAccent,
      'textPositive': 'Publish',
      'colorNegative': Colors.deepOrangeAccent,
      'textNegative': 'Decline',
    },
  ];

  Future refreshList()async{
    postsData = postsData..shuffle();
    notifyListeners();
  }

}