import 'package:flutter/material.dart';
import 'package:tugas/models/item.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.item, this.index,
      {required this.deleteData, required this.updateData, super.key});

  final Item item;
  final int index;
  final Function(int index) deleteData;
  final Function(int index) updateData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.green,
          child: Icon(Icons.inventory_2),
        ),
        title: Text(item.name!),
        subtitle: Text('Rp.${item.price.toString()}\tStok:${item.stock}'),
        trailing: GestureDetector(
          child: const Icon(Icons.delete),
          onTap: () => deleteData(index),
        ),
        onTap: () => updateData(index),
      ),
    );
  }
}
