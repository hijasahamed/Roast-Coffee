import 'package:flutter/material.dart';
import 'package:roast_coffee/view/screens/home_screen.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  getScreen(int index, Size screenSize) {
    switch (index) {
      case 0:
        return HomeScreen(screenSize: screenSize);
      case 1:
        return Center(child: Text("Order Screen"));
      case 2:
        return Center(child: Text("Favorite Screen"));
      case 3:
        return Center(child: Text("Rewards Screen"));
      case 4:
        return Center(child: Text("Profile Screen"));
      default:
        return HomeScreen(screenSize: screenSize);
    }
  }

}