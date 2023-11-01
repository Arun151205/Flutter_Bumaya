// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:modelflutter/models/model_satu.dart';
import 'package:http/http.dart' as http;

class SatuController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<List<ModelSatu>> listsatu = Rx<List<ModelSatu>>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          'https://mocki.io/v1/00c16a49-9669-4076-a94c-d9bbb481f58e'));

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body);

        for (Map<String, dynamic> i in content) {
          listsatu.value.add(ModelSatu.fromJson(i));
          print(listsatu.value.length);
        }
      } else {
        isLoading.value = false;
        print('Terjadi Kesalahan');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
