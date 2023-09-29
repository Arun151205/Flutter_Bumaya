import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_listmap/pages/Home_screen.dart';
import 'package:getx_listmap/pages/inDec_screen.dart';
import 'package:getx_listmap/pages/list_screen.dart';

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
        GetPage(name: "/", page: () => const MyApp()),
        GetPage(name: "/indec", page: () => const InDecScreen()),
        GetPage(name: "/listsc", page: () => const ListScreen()),
      ],
      title: 'Getx',
      home: const HomeScreen(),
    );
  }
}
