import 'package:flutter/material.dart';

class JPAppTheme {

  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 18;
  static const double largeFontSize = 20;
  static const double bigFontSize = 24;

  static ThemeData normalTheme = ThemeData(
    primaryColor: Colors.red,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
    textTheme: TextTheme(
      body1: TextStyle(fontSize: bodyFontSize),
      display1: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      display2: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      display3: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      display4: TextStyle(fontSize: bigFontSize, color: Colors.black87),
    ),
    // 导航栏标题
    primaryTextTheme: TextTheme(
      title: TextStyle(fontSize: 17)
    )
  );
}