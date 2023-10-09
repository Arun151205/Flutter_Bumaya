// ignore_for_file: unused_local_variable, avoid_print
import 'dart:convert';
import 'package:get/get.dart';
import 'package:modelflutter/models/model_dua.dart';
import 'package:http/http.dart' as http;

class DuaController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<List<ModelDua>> listdua = Rx<List<ModelDua>>([]);
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          'https://mocki.io/v1/65f50d68-5338-4f47-8ae3-344605e4eaeb'));

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body);

        for (Map<String, dynamic> i in content) {
          listdua.value.add(ModelDua.fromJson(i));
          print(listdua.value.length);
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
