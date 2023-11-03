// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/controllers/masyarakatController.dart';
import 'package:laporan_masyarakat/controllers/petugasController.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    PetugasController petugasController = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Pengaduan Masyarakat",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/buat");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      "Buat Masyarakat",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(() => masyarakatController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: masyarakatController.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed("/show", arguments: {"index": i});
                            },
                            child: ListTile(
                              splashColor: Colors.green,
                              leading: CircleAvatar(
                                  radius: 30, child: Text("${i + 1}")),
                              title:
                                  Text("${masyarakatController.data[i].nama}"),
                              subtitle: Text(
                                  "${masyarakatController.data[i].username}"),
                            ),
                          );
                        },
                      )),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/buatPetugas");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      "Buat Petugas",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(() => petugasController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: petugasController.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed("/showPetugas",
                                  arguments: {"index": i});
                            },
                            child: ListTile(
                              splashColor: Colors.green,
                              leading: CircleAvatar(
                                  radius: 30, child: Text("${i + 1}")),
                              title: Text(
                                  "${petugasController.data[i].namaPetugas}"),
                              subtitle:
                                  Text("${petugasController.data[i].username}"),
                            ),
                          );
                        },
                      )),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/buatPengaduan");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      "Buat Pengaduan",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
