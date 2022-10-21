import 'package:amr_calculator_app/core/styles/app_text_style.dart';
import 'package:amr_calculator_app/cubits/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/text_form_field.dart';
import 'order_navigator_item.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = OrderCubit.get(context);
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Text(
                    "Current Order",
                    style: AppTextStyle.headLine(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: DefaultTextFormField(
                    hintText: "Search here...",
                    prefixIcon: Icons.search,
                    controller: searchController,
                    textInputType: TextInputType.text,
                    isFilled: true,
                    hasBorder: false,
                    fillColor: Colors.grey.shade100,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: Center(
                    child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => OrderNavigatorItem(
                              title: cubit.orderNavigators[index],
                              isSelected: index == cubit.currentNavigatorIndex,
                              onTap: () {
                                cubit.changeCurrentNavigator(index);
                              },
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 20.w,
                            ),
                        itemCount: cubit.orderNavigators.length),
                  ),
                ),
                cubit.orderScreens[cubit.currentNavigatorIndex]
              ],
            ),
          );
        },
      ),
    );
  }
}