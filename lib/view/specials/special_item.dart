import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';

class SpecialItem extends StatelessWidget {
  SpecialItem({Key? key, required this.text, required this.delete})
      : super(key: key);
  String text;
  final delete;
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        const Icon(
          Icons.check_box_rounded,
          color: AppColors.primaryColor,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(width: 1, color: Colors.grey.shade200)),
            child: Row(
              textDirection: TextDirection.rtl,

              children: [
                Expanded(
                  child: Text(
                    text,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyle.bodyText(),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      delete();
                    },
                    child: Text(
                      "x",
                      style: AppTextStyle.subTitle().copyWith(fontSize: 18.sp),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
