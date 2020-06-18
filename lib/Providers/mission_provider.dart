import 'package:dashboard/Models/mission.dart';
import 'package:flutter/material.dart';

class MissionProvider with ChangeNotifier {
  Mission selectedMission;
  List<Mission> missions = [
    Mission('Data Science', 'Widhya', 35, [
      Task('20', 'task 1'),
      Task('40', 'task 2'),
      Task('60', 'task 3'),
      Task('20', 'task 4'),
    ]),
    Mission('Data Science', 'IBM', 55, [
      Task('40', 'task 1'),
      Task('50', 'task 2'),
      Task('20', 'task 3'),
      Task('30', 'task 4'),
    ]),
    Mission('Data Science', 'Google', 80, [
      Task('70', 'task 1'),
      Task('40', 'task 2'),
      Task('80', 'task 3'),
      Task('20', 'task 4'),
    ]),
    Mission('Data Science', 'Facebook', 95, [
      Task('20', 'task 1'),
      Task('40', 'task 2'),
      Task('60', 'task 3'),
      Task('20', 'task 4'),
    ]),
    Mission('SDE', 'Widhya', 100, [
      Task('20', 'task 1'),
      Task('40', 'task 2'),
      Task('60', 'task 3'),
      Task('20', 'task 4'),
    ]),
    Mission('Data Science', 'IBM', 100, [
      Task('20', 'task 1'),
      Task('40', 'task 2'),
      Task('90', 'task 3'),
      Task('20', 'task 4'),
    ]),
    Mission('SDE', 'Google', 100, [
      Task('20', 'task 1'),
      Task('50', 'task 2'),
      Task('60', 'task 3'),
      Task('70', 'task 4'),
    ]),
    Mission('SDE', 'Facebook', 100, [
      Task('20', 'task 1'),
      Task('40', 'task 2'),
      Task('80', 'task 3'),
      Task('20', 'task 4'),
    ]),
  ];
  void selectMission(Mission m) {
    selectedMission = m;
    notifyListeners();
  }
}
