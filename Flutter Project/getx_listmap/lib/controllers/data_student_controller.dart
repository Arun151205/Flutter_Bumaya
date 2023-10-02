import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataStudentController extends GetxController {
  RxInt studentTotal = RxInt(1);
  RxBool isOpen = RxBool(false);
  RxString classname = RxString("XII RPL 2");
  RxList studentName = RxList([]);
  RxMap<String, String> dataMap = RxMap<String, String>({});

  TextEditingController setClassName = TextEditingController();
  TextEditingController setStudentName = TextEditingController();
  TextEditingController setSchoolSubject = TextEditingController();

  String nama = "";

  void increaseStudent() {
    studentTotal++;
  }

  void decreaseStudent() {
    studentTotal--;
  }

  void closeClass(value) {
    isOpen(value);
  }

  void changeClassname(value) {
    classname(value);
  }

  void addStudentName(name) {
    studentName.add(name);
  }

  void tambahMap(String key, String nama) {
    dataMap["${key}"] = nama;
  }
}
