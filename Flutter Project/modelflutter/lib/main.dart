import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modelflutter/Homepage.dart';
import 'package:modelflutter/screen_dua.dart';
import 'package:modelflutter/screen_ketiga.dart';
import 'package:modelflutter/screen_satu.dart';
import 'package:modelflutter/Show.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      initialRoute: ('/'),
      getPages: [
        GetPage(name: "/Homepage", page: () => Homepage()),
        GetPage(name: "/ScreenPertama", page: () => ScreenSatu()),
        GetPage(name: "/ScreenKedua", page: () => ScreenDua()),
        GetPage(name: "/ScreenKetiga", page: () => ScreenKetiga()),
        GetPage(name: "/Show", page: ()=> Show()),
      ],
    );
  }
}
