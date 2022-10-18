import 'package:amr_calculator_app/models/user_item.dart';
import 'package:amr_calculator_app/services/sql_helper/sql_helper.dart';

import 'item.dart';

class User {
  String? name;
  int? id;
  double? totalPrice;
  int? checkPrice;
  int? isCheck;
  List<Item>? items;
  User({
    this.name,
    this.id,
    this.totalPrice,
    this.checkPrice,
    this.isCheck,
    this.items,
  });

  User.fromLocalDB(Map<String, dynamic> db) {
    id = db['id'];
    name = db['name'];
    checkPrice = db['checkPrice'];
    isCheck = db['isCheck'];
    items = _getUserItems();
  }

  List<Item> _getUserItems() {
    List<Item> items = [];
    SqlHelper.getDataOfTableWithCustomization(
      val: id!,
      colName: 'item_id',
      tableName: SqlHelper.userItemTableName,
    ).then((value) {
      for (var e in value) {
        UserItem userItem = UserItem.fromLocalDB(e);
        SqlHelper.getDataOfTableWithId(
          tableName: SqlHelper.itemsTableName,
          id: userItem.itemId!,
        ).then((value) {
          for (var e in value) {
            items.add(Item.fromLocalDB(e));
          }
        });
      }
    });
    return items;
  }
}
