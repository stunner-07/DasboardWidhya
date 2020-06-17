import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  int calulateDay(int month, int year) {
    month -= 2;
    month = (month) % 13;
    if (month == 11 || month == 12) {
      year--;
    }
    int c = (year / 100).floor();
    int d = (year % 100);
    return ((1 + ((13 * month - 1) / 5) + d + (d / 4) + (c / 4) - (2 * c))
            .floor()) %
        7;
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
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 550,
      child: Column(
        children: [
          RaisedButton(
            child: Text('Month'),
            onPressed: () {
              int emp = calulateDay(DateTime.april, 2020);
              configureList(emp);
              setState(() {});
            },
          ),
          Container(
            width: 500,
            height: calulateDay(DateTime.april, 2020) >= 5 ? 440 : 370,
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
