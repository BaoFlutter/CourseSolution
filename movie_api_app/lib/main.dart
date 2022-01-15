import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        fontFamily: "Comfortaa",
         visualDensity:  VisualDensity.adaptivePlatformDensity
      ),
      home: const HomeScreen(),
    );
  }
}

