import 'package:dashboard/Widgets/chart.dart';
import 'package:dashboard/Widgets/tabs_mission.dart';
import 'package:flutter/material.dart';

import 'calender_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 60),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hi, Champion !!",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Calender(),
                  Container(
                    padding: EdgeInsets.only(left: 60),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Suggested Missions",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Upcoming Missions",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: 370,
                    child: MissionTabs(),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 60),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Data Science Mission",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Charts(),
                ],
              ),
            )
          ],
        ));
  }
}
