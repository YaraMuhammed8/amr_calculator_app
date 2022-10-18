import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/styles/app_colors.dart';
import '../../view/home/items_view/items_view.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  int currentIndex = 0;
  Color color = AppColors.primaryColor;
  List<Widget> views = [
    ItemsView(),
    //GuessTheCheckView(),
    //CheckView(),
  ];
  List<String> titles = [
    'Categories',
    //'Order',
   // 'Check',
  ];
  NavigationBarCubit() : super(NavigationBarInitialState());
  static NavigationBarCubit get(context) => BlocProvider.of(context);
  void ChangeIndex(int index, context) {
    currentIndex = index;

    emit(NavigationBarChangeState());
  }
}
