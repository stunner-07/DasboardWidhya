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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: GestureDetector(
              child: Container(
                child: Text(
                  'Select Month, ' + Provider.of<CalenderState>(context, listen: false)
                      .year
                      .toString(),
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
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: months.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CalenderState>(context, listen: false)
                          .setMonth(i + 1);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey.shade200 ,
                        )),
                      child: Text(
                        months[i],
                        style: TextStyle(),
                        textAlign: TextAlign.center,
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
