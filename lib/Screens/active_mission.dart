import 'package:dashboard/Models/mission.dart';
import 'package:dashboard/Providers/mission_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

enum MissionsType { active, completed }

class MissionsList extends StatefulWidget {
  final MissionsType missionsType;

  const MissionsList({Key key, this.missionsType}) : super(key: key);

  @override
  _MissionsListState createState() => _MissionsListState();
}

class _MissionsListState extends State<MissionsList> {
  Color outlineColor = Colors.grey;
  double th;

  int y = -1;
  @override
  Widget build(BuildContext context) {
    List<Mission> _missionsList = widget.missionsType == MissionsType.active
        ? Provider.of<MissionProvider>(context, listen: false)
            .missions
            .where((element) => element.progress != 100)
            .toList()
        : Provider.of<MissionProvider>(context, listen: false)
            .missions
            .where((element) => element.progress == 100)
            .toList();
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: y == i ? th : 1,
                color: y == i ? outlineColor : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(5),
              color: Colors.lightBlueAccent.withOpacity(0.35),
            ),
            child: ListTile(
              onTap: () {
                Provider.of<MissionProvider>(context, listen: false)
                    .selectMission(_missionsList[i]);
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
                _missionsList[i].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(_missionsList[i].companyName),
              trailing: CircularPercentIndicator(
                radius: 50,
                lineWidth: 5,
                animation: true,
                percent: _missionsList[i].progress / 100,
                center: widget.missionsType == MissionsType.active
                    ? Text(
                        '${_missionsList[i].progress.toString()}%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    : Icon(
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
        itemCount: _missionsList.length,
      ),
    );
  }
}
