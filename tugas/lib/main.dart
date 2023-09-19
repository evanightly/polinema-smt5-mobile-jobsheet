//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:tugas/widgets/home.dart';

//package letak folder Anda
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tambahkan Item',
      home: Home(),
    );
  }
}
