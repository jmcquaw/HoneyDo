import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:honeyDo/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //turned debugger banner off
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme( //font was added from google fonts package in pubspec.yaml
          Theme.of(context).textTheme,
        ),
      ),
      home: Homepage(),
    );
  }
}
