import 'package:flutter/material.dart';
import 'package:roast_coffee/view/screens/home_screen.dart';
import 'package:roast_coffee/view/screens/orders_screen.dart';
import 'package:roast_coffee/view/screens/profile_screen.dart';
import 'package:roast_coffee/view/screens/reward_screen.dart';

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
        return OrdersScreen(screenSize: screenSize);
      case 2:
        return Center(child: Text("Favorite Screen"));
      case 3:
        return RewardScreen(screenSize: screenSize);
      case 4:
        return ProfileScreen(screenSize: screenSize);
      default:
        return HomeScreen(screenSize: screenSize);
    }
  }

}