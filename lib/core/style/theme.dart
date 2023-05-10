import 'package:flutter/material.dart';

class MyTheme {
  static final lighttheme = ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ),
    textTheme: TextTheme(
        headline6: TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    )),
  );
}
