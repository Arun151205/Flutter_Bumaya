import 'package:flutter/material.dart';
import 'package:project_flutter/home_controller.dart';
import 'package:get/get.dart';

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
                icon: Icon(Icons.add)),
            Obx(() => Text(
                      "${hc.count.value}", // Menampilkan nilai dari HomeController
                      style: TextStyle(fontSize: 24), // Gaya teks
                    )),
            IconButton(
                onPressed: () {
                  hc.decrease();
                },
                icon: Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
