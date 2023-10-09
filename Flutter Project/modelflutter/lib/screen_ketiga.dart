import 'package:modelflutter/controllers/dua_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenKetiga extends StatelessWidget {
  const ScreenKetiga({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController duaController = Get.put(DuaController());
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() => duaController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: duaController.listdua.value.length,
                itemBuilder: (context, index) {
                  final dua = duaController.listdua.value[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${dua.firstname}'),
                    ),
                    title: TextButton(
                      child: Text("${dua.createdAt}"),
                      onPressed: () {
                        Get.toNamed("/Show");
                      },
                    ),
                  );
                },
              )),
      ),
    );
  }
}
