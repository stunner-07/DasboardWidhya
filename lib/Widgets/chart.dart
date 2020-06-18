import 'package:dashboard/Models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as ch;

class Charts extends StatelessWidget {
  List<ch.Series> seriesList = _createData();
  static List<ch.Series<ChartData, String>> _createData() {
    final personalData = [
      ChartData('20', 'task 1'),
      ChartData('40', 'task 2'),
      ChartData('60', 'task 3'),
      ChartData('20', 'task 4'),
    ];

    final averageData = [
      ChartData('25', 'task 1'),
      ChartData('33', 'task 2'),
      ChartData('65', 'task 3'),
      ChartData('5', 'task 4'),
    ];

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

  Widget barChart() {
    return ch.BarChart(
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
          ch.TickSpec<num>(10),
          ch.TickSpec<num>(20),
          ch.TickSpec<num>(30),
          ch.TickSpec<num>(40),
          ch.TickSpec<num>(50),
          ch.TickSpec<num>(60),
          ch.TickSpec<num>(70),
        ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 300,
      padding: EdgeInsets.all(20.0),
      child: barChart(),
    );
  }
}
