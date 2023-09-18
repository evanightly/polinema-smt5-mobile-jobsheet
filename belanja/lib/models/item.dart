class Item {
  String name;
  int price;
  int quantity;
  DateTime date = DateTime.now();

  String get formattedDate => '${date.day}-${date.month}-${date.year}';
  Item({required this.name, required this.price, required this.quantity});
}
