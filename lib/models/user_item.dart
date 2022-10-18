class UserItem{
  int? id;
  int? userId;
  int? itemId;

  UserItem({this.id, this.userId, this.itemId});

  UserItem.fromLocalDB(Map<String, dynamic> db){
    id = db['id'];
    userId = db['user_id'];
    itemId = db['item_id'];

  }
}