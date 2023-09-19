const String tableName = 'item';
const String columnId = 'id';
const String columnName = 'name';
const String columnPrice = 'price';
const String columnStock = 'stock';
const String columnItemCode = 'item_code';

class Item {
  int? id;
  String? name;
  int? price;
  int? stock;
  String? itemCode;

  Item(
      {this.id,
      required this.name,
      required this.price,
      required this.stock,
      required this.itemCode});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map[columnId] = id;
    map[columnName] = name;
    map[columnPrice] = price;
    map[columnStock] = stock;
    map[columnItemCode] = itemCode;
    return map;
  }

  Item.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    price = map[columnPrice];
    stock = map[columnStock];
    itemCode = map[columnItemCode];
  }
}
