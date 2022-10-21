import 'package:amr_calculator_app/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';

class ResturantItem extends StatelessWidget {
  ResturantItem({Key? key, required this.onTap, required this.restaurant})
      : super(key: key);
  final onTap;
  Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 250.h,
          decoration: BoxDecoration(
              color: AppColors.lightBackGroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(5, 5),
                    blurRadius: 8,
                    color: Colors.grey.shade300)
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.asset(
                    restaurant.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    restaurant.name,
                    style:
                        AppTextStyle.bodyText().copyWith(fontFamily: "Tajawal"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
