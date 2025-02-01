import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int currentIndex = 0;

  void updateCarosalIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

}