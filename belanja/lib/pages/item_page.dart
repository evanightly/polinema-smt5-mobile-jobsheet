import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${args.name}'),
            const SizedBox(height: 10),
            Text('Price: Rp.${args.price}'),
            const SizedBox(height: 10),
            Text('Quantity: ${args.quantity}'),
            const SizedBox(height: 10),
            Text('Date: ${args.formattedDate}'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
