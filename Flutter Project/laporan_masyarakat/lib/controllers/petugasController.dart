// ignore_for_file: avoid_print, file_names, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:get/get.dart';
import 'package:laporan_masyarakat/models/petugas.dart';
import 'package:http/http.dart' as http;

class PetugasController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<Petugas> data = RxList<Petugas>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      data.value = [];
      loading.value = true;
      var response = await http.get(Uri.parse("http://localhost:5000/petugas"));
      loading.value = false;
      if (response.statusCode == 200) {
        final dataPetugas = jsonDecode(response.body);
        for (Map<String, dynamic> tanggapan in dataPetugas) {
          data.add(Petugas.fromJson(tanggapan));
        }
      } else {
        print("Terjadi Kesalahan");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createData(String namaPetugas, String username, String password, String telp,
      String level) async {
    try {
      loading.value = true;
      var response = await http.post(
        Uri.parse("http://localhost:5000/petugas"),
        body: jsonEncode({
          "nama_petugas": namaPetugas,
          "username": username,
          "password": password,
          "telp": telp,
          "level": level,
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

  updateData(
      idPetugas, String namaPetugas, String username, String telp) async {
    try {
      loading.value = true;
      var response = await http.patch(
        Uri.parse("http://localhost:5000/petugas/${idPetugas}"),
        body: jsonEncode({
          "nama_petugas": namaPetugas,
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

  destroyData(idPetugas) async {
    try {
      loading.value = true;
      var response = await http.delete(
        Uri.parse("http://localhost:5000/petugas/${idPetugas}"),
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
