import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News(this._title, this._date, this._image, {super.key});

  final String _title;
  final String _date;
  final String _image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Row(children: [
            Image.asset(_image, width: 200),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(_title),
            ))
          ]),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(_date),
          )
        ],
      ),
    );
  }
}
