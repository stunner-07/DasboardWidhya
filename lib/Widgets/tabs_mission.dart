import 'package:dashboard/Screens/active_mission.dart';
import 'package:dashboard/Screens/completed_mission.dart';
import 'package:flutter/material.dart';

class MissionTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 40,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      'Active Mission',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Completed Mission',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 20,
                right: 20,
              ),
              height: 260,
              // decoration: BoxDecoration(
              //     border: Border.all(
              //   color: Colors.black,
              //   width: 2,
              // )),
              child: TabBarView(children: [
                ActiveMissions(),
                CompletedMissions(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
