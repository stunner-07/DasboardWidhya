import 'package:dashboard/Providers/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonthView extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 650,
      height: 360,
      child: Column(
        children: [
          Container(
            width: 650,
            height: 60,
            child: Center(
              child: GestureDetector(
                child: Container(
                  width: 80,
                  child: Text(
                    Provider.of<CalenderState>(context, listen: false)
                        .year
                        .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                onTap: () {
                  Provider.of<CalenderState>(context, listen: false)
                      .reconfigureState(3);
                },
              ),
            ),
          ),
          Container(
            width: 650,
            height: 300,
            child: GridView.builder(
                itemCount: months.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2,
                  crossAxisSpacing: 0.1,
                  mainAxisSpacing: 0.1,
                ),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CalenderState>(context, listen: false)
                          .setMonth(i + 1);
                    },
                    child: Card(
                      margin: EdgeInsets.all(1.5),
                      elevation: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          months[i],
                          style: TextStyle(),
                          textAlign: TextAlign.center,
                        ),
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
