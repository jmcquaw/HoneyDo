import 'package:flutter/material.dart';

class HoneyDoTheme {
  static ThemeData get lightTheme { //1
    return ThemeData( //2
      primaryColor: Colors.lightGreen[300],
      backgroundColor: Colors.yellow[50],
      scaffoldBackgroundColor: Colors.yellow[50],
      canvasColor: Colors.yellow[50],
      cardColor: Colors.lightGreen[300],
      fontFamily: 'Comfortaa', //3

      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.lime[900],
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          //backgroundColor: MaterialStateColor(Color(0xFFF9CCCC)),
          //foregroundColor: Colors.lightGreen[300],
        )

      ),

      appBarTheme: AppBarTheme(
        color: Colors.lightGreen[300],
        foregroundColor: Colors.lime[900],
      ),

      cardTheme: CardTheme(
        color: Colors.lightGreen[300]
      ),
    );
  }
}