import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:tugas/helpers/dbhelper.dart';
import 'package:tugas/models/item.dart';
import 'package:tugas/widgets/components/snackbar.dart';
import 'package:tugas/widgets/entry_form.dart';
import 'package:tugas/widgets/item_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late DbHelper dbHelper;
  int count = 0;
  List<Item> itemList = [];
  @override
  void initState() {
    dbHelper = DbHelper();
    updateListItem();
    super.initState();
  }

  updateListItem() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          count = itemList.length;
        });
      });
    });
  }

  addForm() async {
    var item = await navigateToEntryForm(context, null);
    // TODO 2 Panggil Fungsi untuk Insert ke DB
    int result = await dbHelper.insert(item);
    if (result > 0) {
      updateListItem();
      snackbar(context, 'Data berhasil ditambahkan');
    }
  }

  deleteData(int index) async {
    // TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
    int result = await dbHelper.delete(itemList[index].id!);
    if (result > 0) {
      updateListItem();
      snackbar(context, 'Data berhasil dihapus');
    }
  }

  updateData(int index) async {
    var item = await navigateToEntryForm(context, itemList[index]);
    // TODO 4 Panggil Fungsi untuk Update ke DB
    int result = await dbHelper.update(item);
    if (result > 0) {
      updateListItem();
      snackbar(context, 'Data berhasil diubah');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
        actions: [IconButton(onPressed: addForm, icon: const Icon(Icons.add))],
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
      ]),
    );
  }

  Future<Item> navigateToEntryForm(BuildContext context, Item? item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));
    return result;
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return ItemCard(
          itemList[index],
          index,
          deleteData: deleteData,
          updateData: updateData,
        );
      },
    );
  }
}
