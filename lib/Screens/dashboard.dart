import 'package:dashboard/Providers/calender_state.dart';
import 'package:dashboard/Providers/mission_provider.dart';
import 'package:dashboard/Widgets/chart.dart';
import 'package:dashboard/Widgets/tabs_mission.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calender_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.7,
      ),
      body: dashboardContent(context),
    );
  }

  Widget dashboardContent(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CalenderState(),
        ),
        ChangeNotifierProvider.value(
          value: MissionProvider(),
        ),
      ],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [],
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Daily Activity",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Calender(),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
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
                    SizedBox(width: 16.0),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            child: MissionTabs(),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Microtasks",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Charts()),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
