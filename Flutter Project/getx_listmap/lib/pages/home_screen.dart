import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_listmap/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx'),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey,
                    width: 100,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                        onPressed: () {
                          Get.toNamed("/indec"); // Navigasi ke halaman InDecScreen
                        },
                        child: const Text("Increase/Decrease"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/listsc"); // Navigasi ke halaman ListScreen
                        },
                        child: const Text("List Screen"),
                      ),
                      ],
                    )));
              },
              icon: const Icon(Icons.edit_note_outlined))
        ],
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Input Nama'),
                onSubmitted: (value) {
                  homeController.gantiNilai(homeController.namacontroller.text);
                  // Get.defaultDialog(
                  //     title: "nama yang di input",
                  //     middleText: homeController.namacontroller.text,
                  //     onConfirm: () {
                  //       Get.to(const SecondScreen(),
                  //           arguments: homeController.namacontroller.text);
                  //     });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // obx(()=> Text(homeController.nama.value)),
              GetBuilder<HomeController>(builder: (homeController) {
                return Text(homeController.nama);
              }),
              Row(
                children: [
                  Obx(() => Text(
                        homeController.isOpen.value ? "Open" : "Close",
                        style: TextStyle(
                          color: homeController.isOpen.value
                              ? Colors.green
                              : Colors
                                  .red, // Ubah warna teks berdasarkan kondisi "Open" atau "Close"
                        ),
                      )),
                  Obx(() => Switch(
                        value: homeController.isOpen.value,
                        activeColor: homeController.isOpen.value
                            ? Colors.green
                            : Colors
                                .red, // Ubah warna berdasarkan kondisi "Open" atau "Close"
                        onChanged: (value) {
                          homeController.setIsOpen(value);
                        },
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
