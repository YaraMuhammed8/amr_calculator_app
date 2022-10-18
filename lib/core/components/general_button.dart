import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_style.dart';


class GeneralButton extends StatelessWidget {
  Function function;
  String text;
  IconData? icon;
  double? borderRadius;
  double? height;
  Color? backgroundColor;
  Color? textColor;
  bool hasBorder;
  GeneralButton(
      {Key? key,
        required this.function,
        required this.text,
        this.icon,
        this.borderRadius,
        this.height,
        this.backgroundColor,
        this.textColor,
        this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            color: backgroundColor ?? AppColors.primaryColor,
            border: hasBorder
                ? Border.all(color: AppColors.primaryColor, width: 1)
                : null),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          minWidth: double.infinity,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.bodyText()
                    .copyWith(color: textColor ?? Colors.white),
              ),
              if (icon != null) Icon(icon, color: Colors.white)
            ],
          ),
        ));
  }
}