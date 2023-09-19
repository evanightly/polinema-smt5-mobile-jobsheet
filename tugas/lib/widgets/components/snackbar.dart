import 'package:flutter/material.dart';

snackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: Colors.green,
    content: Row(children: [
      const Icon(Icons.check, color: Colors.white),
      const SizedBox(width: 10),
      Text(message)
    ]),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
