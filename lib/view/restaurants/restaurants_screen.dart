import 'package:amr_calculator_app/cubits/main/main_cubit.dart';
import 'package:amr_calculator_app/view/restaurants/restaurant_item.dart';
import 'package:amr_calculator_app/view/user/add_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_text_style.dart';
import '../../../core/utils/naviagtion.dart';
import '../menu/menu_screen.dart';

class RestaurantsScreen extends StatelessWidget {
  RestaurantsScreen({Key? key}) : super(key: key);
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
        body: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            var cubit = MainCubit.get(context);
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10.0),
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.restaurants.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemBuilder: (context, index) => ResturantItem(
                      restaurant: cubit.restaurants[index],
                      onTap: () {
                        AppNavigator.customNavigator(
                            context: context,
                            screen: AddUserScreen(),
                            finish: false);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
