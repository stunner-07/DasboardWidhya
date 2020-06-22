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
    Colors.pink.shade200,
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

  final _headerTextStyle =
      TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF54514d));

  bool _hasEvent(int i) => (events.any((element) =>
              element.date ==
              DateTime.utc(int.parse(yearInCalender),
                  months.indexOf(monthInCalender) + 1, i)) &&
          l[i] != '')
      ? true
      : false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 16.0,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade100,
            ),
            padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: Text(
                  'Sun',
                  style: _headerTextStyle,
                )),
                Container(
                    child: Text(
                  'Mon',
                  style: _headerTextStyle,
                )),
                Container(
                    child: Text(
                  'Tue',
                  style: _headerTextStyle,
                )),
                Container(
                    child: Text(
                  'Wed',
                  style: _headerTextStyle,
                )),
                Container(
                    child: Text(
                  'Thu',
                  style: _headerTextStyle,
                )),
                Container(
                    child: Text(
                  'Fri',
                  style: _headerTextStyle,
                )),
                Container(
                    child: Text(
                  'Sat',
                  style: _headerTextStyle,
                )),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: l.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (ctx, i) {
                  return Container(
                    padding: EdgeInsets.all(4.0),
                    margin: EdgeInsets.all(1.5),
                    decoration: BoxDecoration(
                        color: randomColor(i),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color:
                              l[i] != '' ? Colors.grey.shade200 : Colors.white,
                        )),
                    child: Stack(
                      children: [
                        if (_hasEvent(i))
                          Positioned(
                            top: 0,
                            right: 0,
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
                                  color: Colors.white, letterSpacing: 0.5),
                            ),
                          ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Text(
                            l[i],
                            style: TextStyle(
                                color: _hasEvent(i)
                                    ? Colors.white
                                    : Colors.grey.shade600),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
