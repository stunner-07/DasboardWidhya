import 'dart:math';

import 'package:dashboard/Models/chart_data.dart';
import 'package:dashboard/Models/mission.dart';
import 'package:dashboard/Providers/mission_provider.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as ch;
import 'package:provider/provider.dart';

class Charts extends StatelessWidget {
  int maxi = 0;

  static List<ch.Series<ChartData, String>> _createData(Mission m) {
    final personalData = m.task
        .map((e) => ChartData(
              e.timeTaken.toString(),
              e.taskNo,
            ))
        .toList();
    //List<ChartData> graph = personalData;
    final averageData = [
      ChartData('25', 'task 1'),
      ChartData('33', 'task 2'),
      ChartData('65', 'task 3'),
      ChartData('5', 'task 4'),
    ];
    // graph.addAll(averageData);
    // graph.map((e) => maxi = max(maxi, int.parse(e.timeTaken)));

    return [
      ch.Series<ChartData, String>(
        id: 'Average Data',
        domainFn: (ChartData chartData, _) => chartData.task,
        measureFn: (ChartData chartData, _) => int.parse(chartData.timeTaken),
        data: averageData,
        fillColorFn: (ChartData chartData, _) {
          return ch.MaterialPalette.purple.shadeDefault;
        },
      ),
      ch.Series<ChartData, String>(
        id: 'Personal Data',
        domainFn: (ChartData chartData, _) => chartData.task,
        measureFn: (ChartData chartData, _) => int.parse(chartData.timeTaken),
        data: personalData,
        fillColorFn: (ChartData chartData, _) {
          return ch.MaterialPalette.purple.shadeDefault.lighter;
        },
      ),
    ];
  }

  Mission mission;
  static List<ch.TickSpec<dynamic>> makeLi() {
    List<ch.TickSpec<dynamic>> l = [
      ch.TickSpec<dynamic>('0'),
    ];
    //int s = (maxi / 5).floor();
    String s;
    for (int i = 15; i <= 90; i += 15) {
      if (i < 60)
        s = i.toString();
      else if (i > 3600) {
        s = (i / 3600).toString() + 'hr ';
        i %= 3600;
        if (i >= 60) s += (i / 60).toString() + 'm ';
        i %= 60;
        if (i > 0) s += (i).toString() + 's ';
      }
      l.add(ch.TickSpec<dynamic>(s));
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<MissionProvider>(context).selectedMission == null) {
      mission =
          Provider.of<MissionProvider>(context, listen: false).missions[0];
    } else
      mission = Provider.of<MissionProvider>(context).selectedMission;
    List<ch.Series> seriesList = _createData(mission);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.all(0),
          child: RotatedBox(
            quarterTurns: 3,
            child: Text(
              'Duration',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 10,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: ch.BarChart(
            seriesList,
            animate: true,
            vertical: true,
            barGroupingType: ch.BarGroupingType.grouped,
            defaultRenderer: ch.BarRendererConfig(
              groupingType: ch.BarGroupingType.grouped,
            ),
            primaryMeasureAxis: ch.NumericAxisSpec(
              tickProviderSpec: ch.StaticNumericTickProviderSpec(
                <ch.TickSpec<num>>[
                  ch.TickSpec<num>(0),
                  ch.TickSpec<num>(15),
                  ch.TickSpec<num>(30),
                  ch.TickSpec<num>(45),
                  ch.TickSpec<num>(60),
                  ch.TickSpec<num>(75),
                  ch.TickSpec<num>(90),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
