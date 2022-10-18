import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class TextType extends StatelessWidget {
  final String text;


  TextType(this.text);

  @override
  Widget build(BuildContext context) {
    return  Text(
      "$text",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 20,
      ),
    );

  }
}
