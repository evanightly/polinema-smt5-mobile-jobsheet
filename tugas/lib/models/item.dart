const String tableName = 'item';
const String columnId = 'id';
const String columnName = 'name';
const String columnPrice = 'price';

class Item {
  int? id;
  String? name;
  int? price;

  Item({this.id, required this.name, required this.price});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map[columnId] = id;
    map[columnName] = name;
    map[columnPrice] = price;
    return map;
  }

  Item.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    price = map[columnPrice];
  }
}
