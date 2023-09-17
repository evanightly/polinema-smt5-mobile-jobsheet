import 'package:flutter/material.dart';
import 'package:p01/models/hasil_konversi.dart';

class RiwayatKonversi extends StatelessWidget {
  const RiwayatKonversi(this.riwayatKonversi, {super.key});
  final List<HasilKonversi> riwayatKonversi;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Text('Riwayat Konversi', style: TextStyle(fontSize: 20)),
      ),
      SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          itemCount: riwayatKonversi.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              '${riwayatKonversi[index].satuan} : ${riwayatKonversi[index].nilai.toString()}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      )
    ]);
  }
}
