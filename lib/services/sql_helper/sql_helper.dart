import 'package:amr_calculator_app/models/item.dart';
import 'package:amr_calculator_app/models/order.dart';
import 'package:amr_calculator_app/models/order_user.dart';
import 'package:amr_calculator_app/models/user.dart';
import 'package:amr_calculator_app/models/user_item.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static late Database dataBase;
  static String dbName = "AppDataBase.db";
  static const String itemsTableName = "items";
  static const String userTableName = "users";
  static const String orderTableName = "orders";
  static const String userItemTableName = "UserItems";
  static const String orderUserTableName = "OrderUsers";

  static Future<void> initDB() async {
    dataBase = await openDatabase(
      dbName,
      version: 1,
      onCreate: (Database database, _) async {
        await onCreateDataBase(database: database);
      },
    );
  }

  static Future<void> onCreateDataBase({
    required Database database,
  }) async {
    await database.execute(
        'CREATE TABLE $itemsTableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, special TEXT, price DOUBLE)');
    await database.execute(
        'CREATE TABLE $userTableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, totalPrice DOUBLE, checkPrice DOUBLE, isCheck INTEGER)');
    await database.execute(
        'CREATE TABLE $orderTableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, date TEXT, totalPrice DOUBLE, deliveryPrice DOUBLE)');
    await database.execute(
        'CREATE TABLE $userItemTableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, user_id INTEGER , item_id INTEGER , FOREIGN KEY(user_id) REFERENCES $userTableName(id),FOREIGN KEY(item_id) REFERENCES $itemsTableName(id))');

    await database.execute(
        'CREATE TABLE $orderUserTableName(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, user_id INTEGER, order_id INTEGER , FOREIGN KEY(user_id) REFERENCES $userTableName(id), FOREIGN KEY(order_id) REFERENCES $orderTableName(id))');
  }

  static Future<void> closeDataBase() async {
    return await dataBase.close();
  }

  static Future insertItem({
    required Item item,
  }) async {
    await initDB();
    return await dataBase.rawInsert(
      'INSERT INTO $itemsTableName(name, special, price) VALUES(?, ?, ?)',
      [
        item.name,
        item.special,
        item.price,
      ],
    );
  }

  static Future insertUser({
    required User user,
  }) async {
    await initDB();
    return await dataBase.rawInsert(
      'INSERT INTO $userTableName(name, totalPrice, checkPrice, isCheck) VALUES(?, ?, ?, ?)',
      [
        user.name,
        user.totalPrice,
        user.checkPrice,
        user.isCheck,
      ],
    );
  }

  static Future insertOrder({
    required Order order,
  }) async {
    await initDB();
    return await dataBase.rawInsert(
      'INSERT INTO $orderTableName( date, totalPrice, deliveryPrice) VALUES(?, ?, ?)',
      [
        order.date,
        order.total,
        order.deliveryPrice,
      ],
    );
  }

  static Future insertOrderUser({required OrderUser orderUser}) async {
    await initDB();
    return await dataBase.rawInsert(
      'INSERT INTO $orderUserTableName(user_id, order_id) VALUES(?, ?)',
      [
        orderUser.userId,
        orderUser.orderId,
      ],
    );
  }

  static Future insertUserItem({
    required UserItem userItem,
  }) async {
    await initDB();
    return await dataBase.rawInsert(
      'INSERT INTO $orderUserTableName(user_id, item_id) VALUES(?, ?)',
      [
        userItem.userId,
        userItem.itemId,
      ],
    );
  }

  static Future<List<Map<String, dynamic>>> getDataOfTable({
    required String tableName,
  }) async {
    await initDB();
    return await dataBase.rawQuery('SELECT * FROM $tableName');
  }

  static Future<List<Map<String, dynamic>>> getDataOfTableWithId({
    required String tableName,
    required int id,
  }) async {
    await initDB();
    return await dataBase.rawQuery('SELECT * FROM $tableName WHERE id = $id');
  }

  static Future<List<Map<String, dynamic>>> getDataOfTableWithCustomization({
    required String tableName,
    required dynamic val,
    required String colName,
  }) async {
    await initDB();
    return await dataBase
        .rawQuery('SELECT * FROM $tableName WHERE $colName = "$val"');
  }

  static Future deleteRecorde({
    required String tableName,
    required int id,
  }) async {
    await initDB();
    await dataBase.rawDelete(
      'DELETE FROM $tableName WHERE id = ?',
      [
        id,
      ],
    );
  }

  static Future updateTable({
    required String tableName,
    required String colName,
    required int id,
    required dynamic val,
  }) async {
    await initDB();
    await dataBase.rawUpdate(
      'UPDATE $tableName SET $colName = ? WHERE id = ?',
      [
        val,
        id,
      ],
    );
  }
}
