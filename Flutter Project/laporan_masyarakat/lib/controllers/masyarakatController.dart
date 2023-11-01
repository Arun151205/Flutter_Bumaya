// ignore_for_file: avoid_print, file_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:get/get.dart';
import 'package:laporan_masyarakat/models/masyarakat.dart';
import 'package:http/http.dart' as http;

class MasyarakatController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<Masyarakat> data = RxList<Masyarakat>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      data.value = [];
      loading.value = true;
      var response =
          await http.get(Uri.parse("http://localhost:5000/masyarakat"));
      loading.value = false;
      if (response.statusCode == 200) {
        final dataMasyarakat = jsonDecode(response.body);
        for (Map<String, dynamic> pengaduan in dataMasyarakat) {
          data.add(Masyarakat.fromJson(pengaduan));
        }
      } else {
        print("Terjadi Kesalahan");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createData(String nik, String nama, String username, String password,
      String telp) async {
    try {
      loading.value = true;
      var response = await http.post(
        Uri.parse("http://localhost:5000/masyarakat"),
        body: jsonEncode({
          "nik": nik,
          "nama": nama,
          "username": username,
          "password": password,
          "telp": telp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  updateData(nik, String nama, String username, String telp) async {
    try {
      loading.value = true;
      var response = await http.patch(
        Uri.parse("http://localhost:5000/masyarakat/${nik}"),
        body: jsonEncode({
          "nama": nama,
          "username": username,
          "telp": telp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil diubah");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  destroyData(uuid) async {
    try {
      loading.value = true;
      var response = await http.delete(
        Uri.parse("http://localhost:5000/masyarakat/${uuid}"),
      );
      loading.value = false;

      getData();
      if (response.statusCode == 200) {
        print("Data berhasil dihapus");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
