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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Container(
              child: Text(
                'Select Year',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: years.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<CalenderState>(context, listen: false)
                          .setYear(years[i]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey.shade200,
                          )),
                      child: Text(
                        years[i].toString(),
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
