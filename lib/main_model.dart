import 'package:flutter/cupertino.dart';

class MainModel with ChangeNotifier{
  int selectedIndex = 0;
  void selected(index){
    selectedIndex = index;
    notifyListeners();
  }
}