import 'package:flutter/material.dart';

class InputSuhu extends StatelessWidget {
  const InputSuhu(this._inputController, {super.key});

  final TextEditingController _inputController;
  @override
  Widget build(BuildContext context) => TextField(
        controller: _inputController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Masukkan Suhu Dalam Celcius',
        ),
      );
}
