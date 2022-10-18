class  OrderUser{
  int? id;
  int? orderId;
  int? userId;

  OrderUser.fromLocalDB(Map<String, dynamic> db){
    id = db['id'];
    userId = db['user_id'];
    orderId = db['order_id'];

  }
}