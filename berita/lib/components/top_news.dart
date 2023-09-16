import 'package:flutter/material.dart';

class TopNews extends StatelessWidget {
  const TopNews(this._title, this._date, this._image, {super.key});

  final String _title;
  final String _date;
  final String _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Image.asset(_image),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Text(
              _title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Colors.grey,
            child: Text(
              _date,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
