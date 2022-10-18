
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../core/toast/toast.dart';
import '../../core/utils/naviagtion.dart';
import '../../cubits/navigation_bar_cubit/navigation_bar_cubit.dart';
import '../../cubits/order_cubit/order_cubit.dart';
import '../../enums/ToostStates.dart';
import 'add_user.dart';



class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is ErrorMakeOrderState) {
          Fluttertoast.showToast(
            msg: state.message,
            backgroundColor: chooseToastColor(
              ToastStates.Error,
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<NavigationBarCubit, NavigationBarState>(
          listener: (context, state) {},
          builder: (context, state) {
            var navigationBarCubit = NavigationBarCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.grey.shade100,
              appBar: AppBar(
                backgroundColor: Colors.grey.shade100,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        "assets/images/abo_anas.png",
                      ),
                      radius: 20.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Abo Anas",
                      style: AppTextStyle.appBarText(),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        AppNavigator.customNavigator(
                            context: context,
                            screen: AddUserView(),
                            finish: false);
                      },
                      icon: const Icon(
                        Icons.person_add,
                      ))
                ],
              ),
              body: navigationBarCubit.views
                  .elementAt(navigationBarCubit.currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: navigationBarCubit.currentIndex,
                onTap: (index) {
                  navigationBarCubit.ChangeIndex(index, context);
                },
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add,
                      ),
                      label: 'Order'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_pin), label: 'Check'),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
