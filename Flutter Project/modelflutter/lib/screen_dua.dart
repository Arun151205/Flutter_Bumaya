import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modelflutter/controllers/dua_controller.dart';

class ScreenDua extends StatelessWidget {
  const ScreenDua({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController duaController = Get.put(DuaController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Dua'),
      ),
      body: Container(
        child: Obx(() => duaController.isLoading.value
            ? Center(
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
                    title: Text('${dua.createdAt}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: dua.posts
                              ?.map((post) => Text(
                                    '${post.title ?? ''}',
                                    style: TextStyle(fontSize: 14),
                                  ))
                              .toList() ??
                          [],
                    ), // Add this line
                  );
                })),
      ),
    );
  }
}
