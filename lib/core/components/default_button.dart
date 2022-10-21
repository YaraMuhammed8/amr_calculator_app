import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_style.dart';

class DefaultButton extends StatelessWidget {
  Function onPress;
  String text;
  IconData? icon;
  double? borderRadius;
  double? height;
  double? width;
  Color? backgroundColor;
  Color? textColor;
  bool hasBorder;
  DefaultButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.icon,
      this.borderRadius,
      this.height,
      this.width,
      this.backgroundColor,
      this.textColor,
      this.hasBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 50.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
            color: backgroundColor ?? AppColors.primaryColor,
            border: hasBorder
                ? Border.all(color: AppColors.primaryColor, width: 1)
                : null),
        child: MaterialButton(
          onPressed: () {
            onPress();
          },
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
