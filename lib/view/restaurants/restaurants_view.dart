import 'package:amr_calculator_app/view/restaurants/restaurant_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/naviagtion.dart';
import '../../../core/styles/app_text_style.dart';
import '../home/home_view.dart';

class RestaurantsView extends StatelessWidget {
  RestaurantsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/amr_face.png',
              height: 80.h,
              width: 150.w,
            ),
            Text(
              "المطاعم",
              style: AppTextStyle.appBarText(),
            ),
          ],
        ),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Expanded(
                child: ResturantItem(
              index: 0,
              fun: () {
                AppNavigator.customNavigator(
                    context: context, screen: HomeView(), finish: false);
              },
            )),
            Expanded(
                child: ResturantItem(
              index: 1,
              fun: () {
                AppNavigator.customNavigator(
                    context: context, screen: HomeView(), finish: false);
              },
            )),
          ]),
        ),
      ),
    );
  }
}
