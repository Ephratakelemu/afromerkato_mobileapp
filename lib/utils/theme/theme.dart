import 'package:flutter/material.dart';

class MyAppTheme{

static ThemeData lightTheme= ThemeData(
  useMaterial3: true,
  fontFamily: 'poppins',
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme:const TextTheme(),);

  static ThemeData darkTheme= ThemeData(
      useMaterial3: true,
  fontFamily: 'poppins',
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,
  textTheme:const TextTheme(),);


  }