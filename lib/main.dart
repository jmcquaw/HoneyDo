import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honeyDo/screens/homepage.dart';
import 'package:honeyDo/screens/login_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@Protocol Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.id,
      routes: <String, Widget Function(BuildContext)>{
        LoginScreen.id: (BuildContext context) => LoginScreen(),
        Homepage.id: (BuildContext context) => Homepage(),
      },
    );
  }
}