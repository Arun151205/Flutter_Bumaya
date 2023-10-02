import 'package:getx_listmap/controllers/data_student_controller.dart';
import 'package:getx_listmap/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpdateClassName extends StatelessWidget {
  UpdateClassName({super.key});

  DataStudentController dataStudentController = Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: Text("Edit nama kelas"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              // autofillHints: dataStudentController.classname.toString(),
              controller: dataStudentController.setClassName,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(),
            ),
            ElevatedButton(
                onPressed: () {
                  dataStudentController
                      .changeClassname(dataStudentController.setClassName.text);
                  Get.to(Homepage());
                },
                child: Text("Kirim"))
          ],
        ),
      ),
    );
  }
}
