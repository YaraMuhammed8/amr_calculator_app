class Item {
  String? name;
  String? special;
  double? price;
  int? id;

  Item({this.name, this.special, this.price, this.id});

  Item.fromLocalDB(Map<String, dynamic> db) {
    id = db['id'];
    name = db['name'];
    special = db['special'];
    price = db['price'];
  }
}
