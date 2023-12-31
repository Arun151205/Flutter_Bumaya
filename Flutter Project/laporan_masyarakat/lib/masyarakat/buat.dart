import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/controllers/masyarakatController.dart';
// import 'package:masyarakat/controllers/pengaduanController.dart';

class Buat extends StatelessWidget {
  const Buat({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nik = TextEditingController();
    TextEditingController nama = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController telp = TextEditingController();
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.cyan,
          title: const Text("Create Masyarakat",
              style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nik,
              decoration: const InputDecoration(
                label: Text("Nik"),
              ),
            ),
            TextField(
              controller: nama,
              decoration: const InputDecoration(
                label: Text("nama"),
              ),
            ),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                label: Text("username"),
              ),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                label: Text("password"),
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
                masyarakatController.createData(nik.text, nama.text,
                    username.text, password.text, telp.text);
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
