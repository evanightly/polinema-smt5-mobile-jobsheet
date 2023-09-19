// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:tugas/models/item.dart';

class EntryForm extends StatefulWidget {
  const EntryForm(this.item, {super.key});
  final Item? item;
  @override
  EntryFormState createState() => EntryFormState(item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  static const double defaultSizedBoxHeight = 20;
  static const double defaultSizedBoxWidth = 10;

  Item? item;
  EntryFormState(this.item);

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String appBarTitle = item == null ? 'Tambah Item' : 'Ubah Item';

    if (item != null) {
      nameController.text = item!.name!;
      priceController.text = item!.price.toString();
      itemCodeController.text = item!.itemCode!;
      stockController.text = item!.stock.toString();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: [
              TextField(
                controller: itemCodeController,
                decoration: InputDecoration(
                  labelText: 'Kode Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(height: defaultSizedBoxHeight),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              const SizedBox(height: defaultSizedBoxHeight),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: stockController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Stok Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: defaultSizedBoxWidth),
                  Expanded(
                    child: TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Harga',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultSizedBoxHeight),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () {
                        if (item == null) {
                          // tambah data
                          item = Item(
                              name: nameController.text,
                              price: int.parse(priceController.text),
                              itemCode: itemCodeController.text,
                              stock: int.parse(stockController.text));
                        } else {
                          // ubah data
                          item!.name = nameController.text;
                          item!.price = int.parse(priceController.text);
                          item!.itemCode = itemCodeController.text;
                          item!.stock = int.parse(stockController.text);
                        }
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
