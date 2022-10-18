import 'package:flutter/material.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';

class ResturantItem extends StatelessWidget {
  ResturantItem({Key? key,required this.fun, required this.index}) : super(key: key);

  List<Map<String, String>> events = [
    {"bgPath": "assets/images/abo_anas.png", "name": "ابو انس"},
    {"bgPath": "assets/images/koshary_hind.png", "name": "كشري هند"},
  ];

  final fun;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
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
            children: [
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: Image.asset(
                    events[index]["bgPath"]!,
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
                    events[index]["name"]!,
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
