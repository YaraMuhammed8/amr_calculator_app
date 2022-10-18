import 'package:amr_calculator_app/core/components/general_button.dart';
import 'package:amr_calculator_app/core/styles/app_text_style.dart';
import 'package:amr_calculator_app/view/restaurants/restaurants_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/app_colors.dart';
import '../core/utils/naviagtion.dart';
import '../cubits/order_cubit/order_cubit.dart';
import 'home/home_view.dart';

class FirstView extends StatelessWidget {
  FirstView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Row(
          children: [
            Image.asset(
              'assets/images/amr_face.png',
              height: 80.h,
              width: 150.w,
            ),
            Text(
              "Amr App ",
              style: AppTextStyle.appBarText().copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GeneralButton(
                text: "Create Order",
                function: () {
                  OrderCubit.get(context).makeOrder();
                  AppNavigator.customNavigator(
                      context: context,
                      screen: RestaurantsView(),
                      finish: true);
                }),
            GeneralButton(
                text: "Current Order",
                function: () {
                  AppNavigator.customNavigator(
                      context: context,
                      screen: RestaurantsView(),
                      finish: true);
                }),
          ],
        ),
      )),
    );
  }
}
