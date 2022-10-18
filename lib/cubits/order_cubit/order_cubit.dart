import 'package:amr_calculator_app/models/order.dart';
import 'package:amr_calculator_app/models/order_user.dart';
import 'package:amr_calculator_app/models/user.dart';
import 'package:amr_calculator_app/models/user_item.dart';
import 'package:amr_calculator_app/services/sql_helper/sql_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);
  double calcOrder({
    required Order order,
    required User user,
  }) {
    double result = 0;
    for (var e in user.items!) {
      result += e.price!;
    }
    result += (order.deliveryPrice!) / (order.users!.length - 1);
    return result;
  }

  Order? order;

  void makeOrder() async {
    emit(LoadingMakeOrderState());
    DateTime dateTime = DateTime.now();
    int result = await SqlHelper.insertOrder(
      order: Order(
        date: dateTime.toString(),
        total: 0,
        deliveryPrice: 0,
      ),
    );
    if (result == 1) {
      // SqlHelper.getDataOfTableWithCustomization(
      //   tableName: SqlHelper.orderTableName,
      //   val: dateTime.toString(),
      //   colName: 'date',
      // ).then((value) {
      //   order = Order.fromLocalDB(value.first);
      // });
      emit(SuccessMakeOrderState());
    } else {
      emit(ErrorMakeOrderState(message: "Error while create order"));
    }
  }

  void addUserToOrder(OrderUser orderUser) {
    SqlHelper.insertOrderUser(
      orderUser: orderUser,
    ).then((value) {
      SqlHelper.getDataOfTableWithId(
        tableName: SqlHelper.orderTableName,
        id: orderUser.orderId!,
      ).then((value) {
        order = Order.fromLocalDB(value.single);
      });
    });
  }
}
