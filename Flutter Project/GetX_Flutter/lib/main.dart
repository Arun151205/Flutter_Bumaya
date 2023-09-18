import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter/Home_screen.dart';
import 'package:project_flutter/inDec_screen.dart';
import 'package:project_flutter/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MyApp()),
        GetPage(name: "/indec", page: () => InDecScreen()),
        GetPage(name: "/listsc", page: () => ListScreen()),
      ],
      title: 'Getx',
      home: HomeScreen(),
    );
  }
}
