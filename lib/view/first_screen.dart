import 'package:amr_calculator_app/core/components/default_button.dart';
import 'package:amr_calculator_app/core/styles/app_text_style.dart';
import 'package:amr_calculator_app/view/restaurants/restaurants_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/app_colors.dart';
import '../core/utils/naviagtion.dart';
import 'orders/main_view/orders_screen.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultButton(
                text: "Create Order",
                onPress: () {
                  AppNavigator.customNavigator(
                      context: context,
                      screen: RestaurantsScreen(),
                      finish: false);
                }),
            DefaultButton(
                text: "Current Order",
                onPress: () {
                  AppNavigator.customNavigator(
                      context: context,
                      screen: OrdersScreen(),
                      finish: false);
                }),
          ],
        ),
      ),
    );
  }
}
