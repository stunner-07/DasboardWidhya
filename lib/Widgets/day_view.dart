import 'package:dashboard/Providers/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
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
    if(t==28){
      k=7-empty;
      if(k==7)
      k=0;
      for (int i = 0; i <k ; i++) {
      l.add('');
    }
    emptySlots = empty;
      return;
    }
    k=(k - empty) % 7;
    for (int i = 0; i <k ; i++) {
      l.add('');
    }
    emptySlots = empty;
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 650,
      height: 380,
      child: Column(
        children: [
          Container(
            width: 650,
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
            color: Colors.grey,
            width: 650,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width: 30, child: Text('Sun')),
                Container(width: 30, child: Text('Mon')),
                Container(width: 30, child: Text('Tue')),
                Container(width: 30, child: Text('Wed')),
                Container(width: 30, child: Text('Thu')),
                Container(width: 30, child: Text('Fri')),
                Container(width: 30, child: Text('Sat')),
              ],
            ),
          ),
          Container(
            width: 650,
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
                  return Card(
                    margin: EdgeInsets.all(1.5),
                    elevation: 2,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        l[i],
                        style: TextStyle(),
                        textAlign: TextAlign.start,
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
