import 'package:flutter/material.dart';

class Highlight extends StatelessWidget {
  const Highlight(this.highlights, {super.key});

  final List<String> highlights;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: highlights
          .map((highlight) => TextButton(
              onPressed: null,
              child: Text(
                highlight,
                style: const TextStyle(color: Colors.black87),
              )))
          .toList(),
    );
  }
}
