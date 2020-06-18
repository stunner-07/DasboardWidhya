import 'package:dashboard/Widgets/chart.dart';
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
                  Calender(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Charts(),
                ],
              ),
            )
          ],
        ));
  }
}
