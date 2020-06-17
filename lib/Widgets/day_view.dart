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
    for (int i = 1; i < 32; i++) {
      l.add(i.toString());
    }
    for (int i = 0; i < (4 - empty) % 7; i++) {
      l.add('');
    }
    emptySlots = empty;
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 550,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
              width: 2,
            )),
            width: 500,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    width: 80,
                    child: Text(monthInCalender + ' ,'),
                    alignment: Alignment.centerRight,
                  ),
                  onTap: () {
                    Provider.of<CalenderState>(context, listen: false)
                        .reconfigureState(2);
                  },
                ),
                GestureDetector(
                  child: Text(yearInCalender),
                  onTap: () {
                    Provider.of<CalenderState>(context, listen: false)
                        .reconfigureState(3);
                  },
                ),
                SizedBox(
                  width: 280,
                ),
                IconButton(
                  alignment: Alignment.center,
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
                  icon: Icon(Icons.arrow_left),
                ),
                IconButton(
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
                  icon: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
          Container(
            width: 500,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Sun'),
                Text('Mon'),
                Text('Tue'),
                Text('Wed'),
                Text('Thru'),
                Text('Fri'),
                Text('Sat'),
              ],
            ),
          ),
          Container(
            width: 500,
            height: emptySlots >= 5 ? 440 : 370,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
              width: 2,
            )),
            child: GridView.builder(
                itemCount: l.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (ctx, i) {
                  return Card(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      height: 100,
                      width: 100,
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
