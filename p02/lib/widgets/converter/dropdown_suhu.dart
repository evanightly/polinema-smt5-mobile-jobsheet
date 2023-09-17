import 'package:flutter/material.dart';

class DropdownSuhu extends StatelessWidget {
  const DropdownSuhu(this._listSuhu, this._suhu, this.setSuhu, {super.key});

  final List<String> _listSuhu;
  final String _suhu;
  final void Function(String?) setSuhu;

  @override
  Widget build(BuildContext context) => DropdownButton(
        items: _listSuhu
            .map((suhu) => DropdownMenuItem(value: suhu, child: Text(suhu)))
            .toList(),
        value: _suhu,
        onChanged: setSuhu,
      );
}
