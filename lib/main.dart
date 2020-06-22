import 'package:dashboard/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widhya',
      theme: ThemeData(
          primaryColor: Colors.grey,
          accentColor: Color(0xff8921aa),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          tabBarTheme: TabBarTheme(
              labelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, letterSpacing: 0.5),
              unselectedLabelStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300, letterSpacing: 0.3))),
      home: DashboardScreen(),
      routes: {},
    );
  }
}
