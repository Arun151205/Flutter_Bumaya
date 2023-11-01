import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/controllers/petugasController.dart';

class BuatPetugas extends StatelessWidget {
  const BuatPetugas({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namaPetugas = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController telp = TextEditingController();
    PetugasController petugasController = Get.put(PetugasController());

    RxString selectedLevel = "admin".obs; // Use RxString to observe changes

    final List<String> levelOptions = ["admin", "petugas"];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightGreen,
        title: const Text("Pengaduan Masyarakat",
            style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: namaPetugas,
              decoration: InputDecoration(
                labelText: "Nama Petugas",
              ),
            ),
            TextField(
              controller: username,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            TextField(
              controller: telp,
              decoration: InputDecoration(
                labelText: "Telp",
              ),
            ),
            Obx(() {
              // Observe changes in selectedLevel
              return DropdownButton<String>(
                value: selectedLevel.value,
                onChanged: (newValue) {
                  selectedLevel.value = newValue!;
                },
                items:
                    levelOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                petugasController.createData(namaPetugas.text, username.text,
                    password.text, telp.text, selectedLevel.value);
                Get.toNamed("/");
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
