import 'package:dashboard/Screens/active_mission.dart';
import 'package:flutter/cupertino.dart';
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
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).accentColor.withOpacity(0.15)),
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: [
                  Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Active Mission',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
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
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
              height:  MediaQuery.of(context).size.height * 0.5,
              child: TabBarView(children: [
                MissionsList(missionsType: MissionsType.active,),
                MissionsList(missionsType: MissionsType.completed,),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
