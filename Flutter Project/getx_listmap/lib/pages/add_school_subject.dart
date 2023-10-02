import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_listmap/controllers/data_student_controller.dart';

class AddSchoolSubject extends StatelessWidget {
  const AddSchoolSubject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController key = TextEditingController();
    TextEditingController isi = TextEditingController();
    DataStudentController controller = Get.put(DataStudentController());

// Ganti dengan nilai kunci yang sesuai
// Ganti dengan nama mata pelajaran yang sesuai

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text("Tambah mata pelajaran"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: key,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Masukkan kunci',
              ),
            ),
            TextField(
              controller: isi,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Masukkan nama mata pelajaran',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi tambahMap dengan nilai key dan nama yang sesuai
                controller.tambahMap(key.text,isi.text);
                Get.toNamed('/Homepage');
              },
              child: Text("Kirim"),
            )
          ],
        ),
      ),
    );
  }
}
