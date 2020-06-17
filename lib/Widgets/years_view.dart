import 'package:dashboard/Providers/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> years=[];
    for(int i=2010;i<=DateTime.now().year;i++){
      years.insert(0, i);
    }
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
              child: Container(
                width: 80,
                child: Text(Provider.of<CalenderState>(context, listen: false)
                    .year
                    .toString()),
                alignment: Alignment.centerRight,
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
                itemCount: years.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CalenderState>(context, listen: false)
                          .setYear(years[i]);
                    },
                    child: Card(
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
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
