import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/controllers/petugasController.dart';

class EditPetugas extends StatelessWidget {
  const EditPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PetugasController petugasController = Get.put(PetugasController());
    TextEditingController nama =
        TextEditingController(text: petugasController.data[index].namaPetugas);
    TextEditingController username =
        TextEditingController(text: petugasController.data[index].username);
    TextEditingController telp =
        TextEditingController(text: petugasController.data[index].telp);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nama,
              decoration: const InputDecoration(
                label: Text("nama petugas"),
              ),
            ),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                label: Text("username"),
              ),
            ),
            TextField(
              controller: telp,
              decoration: const InputDecoration(
                label: Text("telp"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                petugasController.updateData(
                    petugasController.data[index].idPetugas,
                    nama.text,
                    username.text,
                    telp.text);
                Get.toNamed("/");
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
