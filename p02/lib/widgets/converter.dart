import 'package:flutter/material.dart';
import 'package:p01/models/hasil_konversi.dart';
import 'package:p01/widgets/converter/dropdown_suhu.dart';
import 'package:p01/widgets/converter/input_suhu.dart';
import 'package:p01/widgets/converter/konversi.dart';
import 'package:p01/widgets/converter/riwayat_konversi.dart';
import 'package:p01/widgets/result.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

const _listSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];

class _ConverterState extends State<Converter> {
  final _inputController = TextEditingController();
  final List<HasilKonversi> _riwayatKonversi = [];
  String _suhu = _listSuhu[0];
  num _result = 0;

  setSuhu(suhu) {
    setState(() {
      _suhu = suhu;
      konversiSuhu();
    });
  }

  konversiSuhu() {
    setState(() {
      num userInput = double.parse(_inputController.text);
      if (_suhu == "Kelvin") {
        _result = userInput + 273.15;
      } else if (_suhu == "Reamur") {
        _result = userInput * (4 / 5);
      } else {
        _result = userInput * (9 / 5) + 32;
      }

      _riwayatKonversi.add(HasilKonversi(_suhu, _result));
    });
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Konverter Suhu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            InputSuhu(_inputController),
            DropdownSuhu(_listSuhu, _suhu, (setSuhu)),
            Result(_result),
            Konversi(konversiSuhu),
            RiwayatKonversi(_riwayatKonversi)
          ],
        ),
      ),
    );
  }
}
