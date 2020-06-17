import 'package:dashboard/Screens/dashboard.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widhya',
        theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Colors.green,
        ),
        home: DashboardScreen(),
        routes: {
        },
    );
  }
}
