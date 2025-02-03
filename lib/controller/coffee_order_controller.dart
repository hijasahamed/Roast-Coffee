import 'package:flutter/material.dart';

class CoffeeOrderProvider with ChangeNotifier {
  String _selectedSize = "Medium";
  String _selectedMilk = "Regular";
  int _count = 1;

  String get selectedSize => _selectedSize;
  String get selectedMilk => _selectedMilk;
  int get count => _count;

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void selectMilk(String milk) {
    _selectedMilk = milk;
    notifyListeners();
  }

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    if (_count > 1) {
      _count--;
      notifyListeners();
    }
  }

  void resetCount() {
    _count = 1;  
    notifyListeners();
  }
}
