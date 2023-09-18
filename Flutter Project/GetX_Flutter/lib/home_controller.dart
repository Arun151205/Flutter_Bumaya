import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController namacontroller = TextEditingController();
  RxBool isOpen = RxBool(true);
  RxInt count = RxInt(0); // Menambahkan RxInt untuk menyimpan nilai

  String nama = "";

  void gantiNilai(String nm) {
    nama = nm;
    update();
  }

  void setIsOpen(bool Open) {
    isOpen(Open);
    print(isOpen.value);
  }

  void increase() {
    count.value++; // Menambahkan 1 ke nilai
    update(); // Memperbarui tampilan setelah penambahan
  }

  void decrease() {
    if (count.value > 0) {
      count.value--; // Mengurangkan 1 dari nilai jika nilai > 0
      update(); // Memperbarui tampilan setelah pengurangan
    }
  }

  // void ChangeName(String nm) {
  //   nama.value = nm;
  //   print(nama.value);
  //   Get.snackbar('nilai', nama.value,
  //       snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 5));
  // }
}
