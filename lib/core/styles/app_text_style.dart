import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle headLine() => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
        color: Colors.black,
        fontFamily: "Tajawal",
      );

  static TextStyle appBarText() => TextStyle(
        color: Colors.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        fontFamily: "Tajawal",
      );

  static TextStyle bodyText() => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: "Tajawal",
      );
  static TextStyle subTitle() => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w800,
        color: Colors.grey,
        fontFamily: "Tajawal",
      );

  static TextStyle title() => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: "Tajawal",
      );
}