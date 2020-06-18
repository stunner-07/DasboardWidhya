import 'package:dashboard/Models/mission.dart';
import 'package:dashboard/Providers/mission_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class CompletedMissions extends StatefulWidget {
  @override
  _CompletedMissionsState createState() => _CompletedMissionsState();
}

class _CompletedMissionsState extends State<CompletedMissions> {
  Color outlineColor = Colors.grey;
  double th;

  int y = -1;
  @override
  Widget build(BuildContext context) {
    List<Mission> complete =
        Provider.of<MissionProvider>(context, listen: false)
            .missions
            .where((element) => element.progress == 100)
            .toList();
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      height: 100,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: y == i ? th : 1,
                color: y == i ? outlineColor : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
              color: Colors.lightBlueAccent.withOpacity(0.35),
            ),
            child: ListTile(
              onTap: () {
                Provider.of<MissionProvider>(context, listen: false)
                    .selectMission(complete[i]);
                setState(() {
                  y = i;
                  outlineColor = Colors.blue.shade800;

                  th = 3;
                });
              },
              leading: Container(
                height: 80,
                width: 40,
              ),
              title: Text(
                complete[i].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(complete[i].companyName),
              trailing: CircularPercentIndicator(
                radius: 50,
                lineWidth: 5,
                animation: true,
                percent: 1,
                center: Icon(
                  Icons.check,
                  color: Colors.blue.shade900,
                  size: 30,
                ),
                backgroundColor: Colors.lightBlueAccent.withOpacity(0.35),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blue.shade900,
              ),
            ),
          );
        },
        itemCount: complete.length,
      ),
    );
  }
}
