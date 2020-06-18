import 'package:dashboard/Models/mission.dart';
import 'package:flutter/material.dart';

class ActiveMissions extends StatelessWidget {
  List<Mission> active = [
    Mission('Data Science', 'Widhya'),
    Mission('Data Science', 'IBM'),
    Mission('Data Science', 'Google'),
    Mission('Data Science', 'Facebook'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: 100,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.only(
              top: 8,
            ),
            color: Colors.lightBlueAccent.withOpacity(0.35),
            child: ListTile(
              leading: Container(
                height: 80,
                width: 40,
              ),
              title: Text(
                active[i].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(active[i].companyName),
            ),
          );
        },
        itemCount: active.length,
      ),
    );
  }
}
