import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  final TextEditingController _celciusController = TextEditingController();
  num _kelvin = 0;
  num _reamur = 0;

  konversi() {
    setState(() {
      _kelvin = num.parse(_celciusController.text) + 273;
      _reamur = num.parse(_celciusController.text) * (4 / 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: _celciusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text('Suhu dalam Kelvin'),
                      const SizedBox(height: 20),
                      Text(
                        _kelvin.toStringAsFixed(0),
                        style: const TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Suhu dalam Reamur'),
                      const SizedBox(height: 20),
                      Text(
                        _reamur.toStringAsFixed(0),
                        style: const TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: konversi,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 35),
                ),
                child: const Text('Konversi Suhu'),
              )
            ],
          ),
        ));
  }
}
