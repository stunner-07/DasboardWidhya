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
      width: 500,
      height: 500,
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
            child: Center(
              child: GestureDetector(
                child: Container(
                  width: 80,
                  child: Text(Provider.of<CalenderState>(context, listen: false)
                      .year
                      .toString()),
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
            width: 500,
            height: 400,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
              width: 2,
            )),
            child: GridView.builder(
                itemCount: months.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: (){
                       Provider.of<CalenderState>(context, listen: false)
                      .setMonth(i+1);
                    },
                    child: Card(
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
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
