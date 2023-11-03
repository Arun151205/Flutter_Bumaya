import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/controllers/petugasController.dart';

class ShowPetugas extends StatelessWidget {
  const ShowPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PetugasController petugasController = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.cyan,
          title: const Text("Show Petugas",
              style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nama Petugas :"),
                Text("${petugasController.data[index].namaPetugas}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Username :"),
                Text("${petugasController.data[index].username}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Telepon :"),
                Text("${petugasController.data[index].telp}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Level :"),
                Text("${petugasController.data[index].level}"),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/editPetugas", arguments: {"index": index});
                },
                child: const Text("Edit")),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  petugasController
                      .destroyData(petugasController.data[index].idPetugas);
                  Get.toNamed("/");
                },
                child: const Text("Hapus")),
          ],
        ),
      ),
    );
  }
}
