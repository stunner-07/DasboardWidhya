import 'package:dashboard/Providers/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> years = [];
    for (int i = 2000; i <= DateTime.now().year; i++) {
      years.insert(0, i);
    }
    return Container(
      width: 650,
      height: 360,
      child: Column(
        children: [
          Container(
            width: 650,
            height: 60,
            child: Center(
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
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            width: 650,
            height: 300,
            child: GridView.builder(
                itemCount: years.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 2,
                  crossAxisSpacing: 0.1,
                  mainAxisSpacing: 0.1,
                ),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CalenderState>(context, listen: false)
                          .setYear(years[i]);
                    },
                    child: Card(
                      margin: EdgeInsets.all(1.5),
                      elevation: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          years[i].toString(),
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
