import 'package:getx_listmap/pages/Homepage.dart';
import 'package:getx_listmap/pages/update_classname.dart';
import 'package:getx_listmap/pages/add_student.dart';
import 'package:getx_listmap/pages/add_school_subject.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Homepage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: "/Homepage", page: () => Homepage()),
        GetPage(name: "/UpdateClassname", page: () => UpdateClassName()),
        GetPage(name: "/AddSchoolObject", page: () => AddSchoolSubject()),
        GetPage(name: "/AddStudent", page: () => AddStudent()),
      ],
    );
  }
}
