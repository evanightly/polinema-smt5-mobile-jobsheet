import 'package:berita/components/highlight.dart';
import 'package:berita/components/news.dart';
import 'package:berita/components/top_news.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('My News')),
      body: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: const Column(
          children: [
            Highlight(['NASIONAL', 'POLITIK', 'INTERNASIONAL']),
            TopNews(
              'Data Intelijen di Tangan Bikin Jokowi Tahu Semua Pergerakan Parpol',
              'Sabtu, 16 Sep 2023 20:49 WIB',
              'assets/images/jokowi.jpeg',
            ),
            News(
              'Pendakian Gunung Bromo Dibuka Kembali',
              'Sabtu, 16 Sep 2023 21:07 WIB',
              'assets/images/bromo.jpeg',
            ),
            News(
              'PAN Sebut AHY Sudah Bertemu Ketum Parpol KIM, Bahas Arah Koalisi Demokrat',
              'Sabtu, 16 Sep 2023 20:30 WIB',
              'assets/images/saleh.jpeg',
            ),
          ],
        ),
      ),
    ),
  ));
}
