import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_listmap/controllers/home_controller.dart';

class InDecScreen extends StatelessWidget {
  const InDecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.find();
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  hc.increase();
                },
                icon: const Icon(Icons.add)),
            Obx(() => Text(
                  "${hc.count.value}", // Menampilkan nilai dari HomeController
                  style: const TextStyle(fontSize: 24), // Gaya teks
                )),
            IconButton(
                onPressed: () {
                  hc.decrease();
                },
                icon: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
