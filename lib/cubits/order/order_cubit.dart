import 'package:amr_calculator_app/view/orders/full_order/full_order_screen.dart';
import 'package:amr_calculator_app/view/orders/guess/guess_check_screen.dart';
import 'package:amr_calculator_app/view/orders/names/order_names_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  static OrderCubit get(context) => BlocProvider.of(context);
  List<String> orderNavigators = ["Full order", "names", "Guess"];
  List<Widget> orderScreens = [
    FullOrderScreen(),
    OrderNamesScreen(),
    GuessTheCheckScreen()
  ];
  int currentNavigatorIndex = 0;
  void changeCurrentNavigator(int index) {
    currentNavigatorIndex = index;
    emit(ChangeCurrentNavigatorState());
  }
}