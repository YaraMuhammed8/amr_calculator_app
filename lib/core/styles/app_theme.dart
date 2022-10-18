import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

ThemeData appTheme = ThemeData(
  primarySwatch: AppColors.primarySwatchColor,
  scaffoldBackgroundColor: AppColors.lightBackGroundColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: AppTextStyle.appBarText(),
    iconTheme: const IconThemeData(color: Colors.black),
    elevation: 0,
    color: AppColors.lightBackGroundColor,
  ),
  fontFamily: "Tajawal",
);
