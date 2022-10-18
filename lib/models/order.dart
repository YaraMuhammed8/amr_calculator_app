import 'package:amr_calculator_app/models/order_user.dart';
import 'package:amr_calculator_app/models/user.dart';
import 'package:amr_calculator_app/services/sql_helper/sql_helper.dart';

class Order {
  int? id;
  String? date;
  double? total;
  double? deliveryPrice;
  List<User>? users;

  Order({
    this.id,
    this.date,
    this.total,
    this.deliveryPrice,
    this.users,
  });

  Order.fromLocalDB(Map<String, dynamic> db) {
    id = db['id'];
    date = db['date'];
    total = db['totalPrice'];
    deliveryPrice = db['deliveryPrice'];
    users = _getUsersOfOrder();
  }

  List<User> _getUsersOfOrder() {
    List<User> users = [];
    SqlHelper.getDataOfTableWithCustomization(
      tableName: SqlHelper.orderUserTableName,
      val: id!,
      colName: 'order_id',
    ).then((value) {
      for (var e in value) {
        OrderUser orderUser = OrderUser.fromLocalDB(e);
        SqlHelper.getDataOfTableWithId(
          tableName: SqlHelper.userTableName,
          id: orderUser.userId!,
        ).then((value) {
          for (var e in value) {
            users.add(User.fromLocalDB(e));
          }
        });
      }
    });
    return users;
  }
}
