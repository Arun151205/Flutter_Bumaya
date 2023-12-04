// ignore_for_file: avoid_print, file_names, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/models/pengaduan.dart';
import 'package:http/http.dart' as http;

class PengaduanController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<Pengaduan> data = RxList<Pengaduan>([]);
  RxBool web = RxBool(false);
  PlatformFile? imagepicked;
  late Uint8List fileWeb;

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
          await http.get(Uri.parse("http://localhost:5000/pengaduan"));
      loading.value = false;
      if (response.statusCode == 200) {
        final dataPengaduan = jsonDecode(response.body);
        for (Map<String, dynamic> pengaduan in dataPengaduan) {
          data.add(Pengaduan.fromJson(pengaduan));
        }
      } else {
        print("Terjadi Kesalahan");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createData(Map data) async {
    if (data["status"] != "0" &&
        data["status"] != "proses" &&
        data["status"] != "selesai")
      return "Status antara proses, selesai atau 0";
    if (!web.value) return "Tidak ada gambar";

    final url = Uri.parse('http://localhost:5000/pengaduan');
    var request = http.MultipartRequest('POST', url);
    request.files.add(http.MultipartFile.fromBytes(
      'foto',
      Uint8List.fromList(imagepicked!.bytes!),
      filename: imagepicked!.name,
    ));

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();
    print(responseBody);
    getData();
    web.value = false;
    return "success";
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
