import 'package:dashboard/Providers/calender_state.dart';
import 'package:dashboard/Widgets/day_view.dart';
import 'package:dashboard/Widgets/month_view.dart';
import 'package:dashboard/Widgets/years_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    var stateNum = Provider.of<CalenderState>(context).stateNo;
    if(stateNum==1)
    return DayView();
    else if(stateNum==2)
    return MonthView();
    else
    return YearsView();
  }
}
