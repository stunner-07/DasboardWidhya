import 'package:dashboard/Widgets/chart.dart';
import 'package:flutter/material.dart';

import 'calender_screen.dart';
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Charts(),
      //Calender(),
    );
  }
}