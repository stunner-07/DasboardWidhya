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
              height: 50,
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Active Mission',
                  ),
                  Tab(
                    text: 'Completed Mission',
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
              height: 280,
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
