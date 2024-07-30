import 'package:flutter/material.dart';
import 'navigationmenu.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afromerkato e-commerce',
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      darkTheme:ThemeData(),
      home: MainPage(),
    );
  }
}