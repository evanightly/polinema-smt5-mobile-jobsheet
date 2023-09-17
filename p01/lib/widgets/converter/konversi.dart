import 'package:flutter/material.dart';

class Konversi extends StatelessWidget {
  const Konversi(this.konversiSuhu, {super.key});

  final Function() konversiSuhu;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: konversiSuhu,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 36),
      ),
      child: const Text('Konversi Suhu'),
    );
  }
}
