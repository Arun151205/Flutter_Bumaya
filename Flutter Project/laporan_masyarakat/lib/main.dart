import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laporan_masyarakat/beranda.dart';
import 'package:laporan_masyarakat/masyarakat/buat.dart';
import 'package:laporan_masyarakat/petugas/buatPetugas.dart';
import 'package:laporan_masyarakat/masyarakat/edit.dart';
import 'package:laporan_masyarakat/masyarakat/show.dart';
import 'package:laporan_masyarakat/petugas/showPetugas.dart';
import 'package:laporan_masyarakat/petugas/editPetugas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pengaduan Masyarakat',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/buat", page: () => const Buat()),
        GetPage(name: "/show", page: () => const Show()),
        GetPage(name: "/edit", page: () => const Edit()),
        GetPage(name: "/buatPetugas", page: () => const BuatPetugas()),
        GetPage(name: "/showPetugas", page: () => const ShowPetugas()),
        GetPage(name: "/editPetugas", page: () => const EditPetugas()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 97, 218, 159)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      home: const Beranda(),
    );
  }
}
