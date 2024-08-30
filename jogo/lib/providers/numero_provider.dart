import 'package:flutter/material.dart';

class NumberProvider with ChangeNotifier {
  List<int> _numbers = List.generate(8, (index) => 0);

  List<int> get numbers => _numbers;

  void setNumber(int index, int value) {
    if (index >= 0 && index < _numbers.length) {
      _numbers[index] = value;
      notifyListeners();
    }
  }

  void sortNumbers() {
    _numbers.sort();
    notifyListeners();
  }

  int findNumber(int key) {
    return _numbers.indexOf(key);
  }
}
