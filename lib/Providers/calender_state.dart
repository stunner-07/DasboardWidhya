import 'package:flutter/material.dart';

class CalenderState with ChangeNotifier {
  int stateNo = 1;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  void reconfigureState(int i) {
    stateNo = i;
    notifyListeners();
  }

  void setMonth(int m) {
    month = m;
    stateNo = 1;
    notifyListeners();
  }

  void setYear(int y) {
    year = y;
    stateNo = 2;
    notifyListeners();
  }
}
