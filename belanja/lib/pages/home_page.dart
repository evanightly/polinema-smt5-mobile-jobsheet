import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Item> items = [
    Item(name: 'Sugar', price: 24000, quantity: 2),
    Item(name: 'Salt', price: 10000, quantity: 5),
    Item(name: 'Egg', price: 32000, quantity: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => ItemCard(items[index])),
      ),
    );
  }
}
