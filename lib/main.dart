import 'package:dashboard/Providers/calender_state.dart';
import 'package:dashboard/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CalenderState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widhya',
        theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Colors.green,
        ),
        home: DashboardScreen(),
        routes: {},
      ),
    );
  }
}
