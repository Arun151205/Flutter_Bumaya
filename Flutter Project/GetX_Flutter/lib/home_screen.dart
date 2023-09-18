import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter/home_controller.dart';
// import 'package:project_flutter/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx'),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                    padding: EdgeInsets.all(10),
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
                        child: Text("Increase/Decrease"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/listsc"); // Navigasi ke halaman ListScreen
                        },
                        child: Text("List Screen"),
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
                controller: hc.namacontroller,
                decoration: const InputDecoration(labelText: 'Input Nama'),
                onSubmitted: (value) {
                  hc.gantiNilai(hc.namacontroller.text);
                  // Get.defaultDialog(
                  //     title: "nama yang di input",
                  //     middleText: hc.namacontroller.text,
                  //     onConfirm: () {
                  //       Get.to(const SecondScreen(),
                  //           arguments: hc.namacontroller.text);
                  //     });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // obx(()=> Text(hc.nama.value)),
              GetBuilder<HomeController>(builder: (hc) {
                return Text(hc.nama);
              }),
              Row(
                children: [
                  Obx(() => Text(
                        hc.isOpen.value ? "Open" : "Close",
                        style: TextStyle(
                          color: hc.isOpen.value
                              ? Colors.green
                              : Colors
                                  .red, // Ubah warna teks berdasarkan kondisi "Open" atau "Close"
                        ),
                      )),
                  Obx(() => Switch(
                        value: hc.isOpen.value,
                        activeColor: hc.isOpen.value
                            ? Colors.green
                            : Colors
                                .red, // Ubah warna berdasarkan kondisi "Open" atau "Close"
                        onChanged: (value) {
                          hc.setIsOpen(value);
                        },
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
