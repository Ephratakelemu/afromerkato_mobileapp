import 'package:afromerkatoecommerce/app_pages/splashscreen/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
   WidgetsFlutterBinding.ensureInitialized();


 runApp(MyApp());
}

class MyApp extends StatelessWidget {

 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afromerkato e-commerce',
      themeMode: ThemeMode.system,
      theme: ThemeData(),
      darkTheme: ThemeData(),
      home: SplashscreenView(),
    );
  }
}
