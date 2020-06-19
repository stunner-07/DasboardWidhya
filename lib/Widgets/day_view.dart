import 'package:dashboard/Models/events.dart';
import 'package:dashboard/Providers/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  List<Events> events = [
    Events(DateTime.utc(2020, 6, 17), 'Widhya'),
    Events(DateTime.utc(2020, 6, 5), 'Maths'),
    Events(DateTime.utc(2020, 6, 21), 'Code'),
    Events(DateTime.utc(2020, 6, 12), 'Develop'),
    Events(DateTime.utc(2020, 6, 27), 'Learn'),
    Events(DateTime.utc(2020, 6, 30), 'Kshitij'),
    Events(DateTime.utc(2020, 6, 18), 'Rahul'),
  ];
  List<Color> listColor = [
    Colors.red.shade200,
    Colors.blue.shade200,
    Colors.yellow.shade200,
    Colors.purpleAccent.shade200,
    Colors.green.shade200,
  ];
  Color randomColor(int i) {
    var r = Random();
    if (events.any((element) =>
            element.date ==
            DateTime.utc(int.parse(yearInCalender),
                months.indexOf(monthInCalender) + 1, i)) &&
        l[i] != '')
      return listColor[r.nextInt(4)];
    else
      return Colors.white;
  }

  String monthInCalender;
  String yearInCalender;
  int emptySlots;
  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  int calulateDay(int month, int year) {
    monthInCalender = months[month - 1];
    yearInCalender = year.toString();
    //print(yearInCalender);
    month -= 2;
    if (month <= 0) month--;
    month = (month) % 13;
    //print(month);
    if (month == 11 || month == 12) {
      year--;
    }
    int c = (year / 100).floor();
    int d = (year % 100);
    return (((1 +
                (((13 * month) - 1) / 5).floor() +
                d +
                (d / 4).floor() +
                (c / 4).floor() -
                (2 * c))
            .floor()) %
        7);
  }

  @override
  void didChangeDependencies() {
    int emp = calulateDay(
        Provider.of<CalenderState>(context, listen: false).month,
        Provider.of<CalenderState>(context, listen: false).year);
    configureList(emp);
    super.didChangeDependencies();
  }

  List<String> l = [];
  void configureList(int empty) {
    l.clear();
    for (int i = 0; i < empty; i++) {
      l.insert(0, '');
    }
    int t;
    int k;
    if (monthInCalender == 'February' && int.parse(yearInCalender) % 4 != 0) {
      t = 28;
    } else if (monthInCalender == 'February' &&
        int.parse(yearInCalender) % 4 == 0) {
      t = 29;
      k = 6;
    } else if (monthInCalender == 'January' ||
        monthInCalender == 'March' ||
        monthInCalender == 'May' ||
        monthInCalender == 'July' ||
        monthInCalender == 'August' ||
        monthInCalender == 'October' ||
        monthInCalender == 'December') {
      t = 31;
      k = 4;
    } else {
      t = 30;
      k = 5;
    }
    for (int i = 1; i <= t; i++) {
      l.add(i.toString());
    }
    if (t == 28) {
      k = 7 - empty;
      if (k == 7) k = 0;
      for (int i = 0; i < k; i++) {
        l.add('');
      }
      emptySlots = empty;
      return;
    }
    k = (k - empty) % 7;
    for (int i = 0; i < k; i++) {
      l.add('');
    }
    emptySlots = empty;
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 360,
      child: Column(
        children: [
          Container(
            width: 600,
            height: 40,
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 0,
                            bottom: 5,
                            top: 5,
                          ),
                          // width: 80,
                          child: Text(
                            monthInCalender + ' ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        onTap: () {
                          Provider.of<CalenderState>(context, listen: false)
                              .reconfigureState(2);
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            left: 0,
                            bottom: 5,
                            top: 5,
                          ),
                          child: Text(
                            yearInCalender,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        onTap: () {
                          Provider.of<CalenderState>(context, listen: false)
                              .reconfigureState(3);
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 70,
                  child: IconButton(
                    padding: EdgeInsets.only(
                      bottom: 10,
                      right: 5,
                    ),
                    iconSize: 15,
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      int m = months.indexOf(monthInCalender);
                      int y = int.parse(yearInCalender);
                      if (m == 0) {
                        y--;
                        m = 12;
                      }
                      int emp = calulateDay(m, y);
                      configureList(emp);
                      setState(() {});
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Positioned(
                  right: 20,
                  child: IconButton(
                    padding: EdgeInsets.only(
                      bottom: 10,
                      left: 5,
                    ),
                    alignment: Alignment.centerLeft,
                    iconSize: 15,
                    onPressed: () {
                      int m = months.indexOf(monthInCalender);
                      int y = int.parse(yearInCalender);
                      if (m == 11) {
                        y++;
                        m = -1;
                      }
                      int emp = calulateDay(m + 2, y);
                      configureList(emp);
                      setState(() {});
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade400,
            width: 600,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 30,
                    child: Text(
                      'Sun',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
                Container(
                    width: 30,
                    child: Text(
                      'Mon',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
                Container(
                    width: 30,
                    child: Text(
                      'Tue',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
                Container(
                    width: 30,
                    child: Text(
                      'Wed',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
                Container(
                    width: 30,
                    child: Text(
                      'Thu',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
                Container(
                    width: 30,
                    child: Text(
                      'Fri',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
                Container(
                    width: 30,
                    child: Text(
                      'Sat',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    )),
              ],
            ),
          ),
          Container(
            width: 600,
            height: emptySlots >= 5 ? 300 : 250,
            child: GridView.builder(
                itemCount: l.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 2,
                  crossAxisSpacing: 0.1,
                  mainAxisSpacing: 0.1,
                ),
                itemBuilder: (ctx, i) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        )),
                    child: Card(
                      color: randomColor(i),
                      margin: EdgeInsets.all(1.5),
                      elevation: 0,
                      child: Stack(
                        children: [
                          if (events.any((element) =>
                                  element.date ==
                                  DateTime.utc(
                                      int.parse(yearInCalender),
                                      months.indexOf(monthInCalender) + 1,
                                      i)) &&
                              l[i] != '')
                            Positioned(
                              top: 1,
                              right: 1,
                              child: Text(
                                events
                                    .firstWhere((element) =>
                                        element.date ==
                                        DateTime.utc(
                                            int.parse(yearInCalender),
                                            months.indexOf(monthInCalender) + 1,
                                            i))
                                    .msg,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          Positioned(
                            bottom: 1,
                            left: 1,
                            child: Text(
                              l[i],
                              style: TextStyle(),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
