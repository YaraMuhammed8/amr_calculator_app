import 'package:amr_calculator_app/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_colors.dart';

class OrderNavigatorItem extends StatelessWidget {
  OrderNavigatorItem(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTap})
      : super(key: key);
  String title;
  bool isSelected;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 40.h,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30.r),

        ),
        child: Text(
          title,
          style: AppTextStyle.bodyText()
              .copyWith(color: isSelected ? Colors.grey.shade100: Colors.grey,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
