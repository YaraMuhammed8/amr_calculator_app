import 'package:amr_calculator_app/core/components/default_button.dart';
import 'package:amr_calculator_app/core/styles/app_colors.dart';
import 'package:amr_calculator_app/view/specials/specials_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/app_text_style.dart';
import '../../models/item.dart';

class CardItem extends StatefulWidget {
  CardItem({Key? key, required this.fun, required this.item}) : super(key: key);

  final fun;
  Item item;
  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  int? selectedUserId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => SpecialsScreen(
                  item: widget.item,
                ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              "assets/images/amr_face.png",
              height: 150.h,
              width: 150.w,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            widget.item.name!,
            style: AppTextStyle.bodyText(),
            textDirection: TextDirection.rtl,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Text("${widget.item.price} EGP",
              style: AppTextStyle.subTitle()
                  .copyWith(color: AppColors.primaryColor)),
          //const Spacer(),
          // DefaultButton(
          //     text: "Add",
          //     borderRadius: 10.h,
          //     height: 30.h,
          //     onPress: () {
          //       //   showDialog(
          //       //     context: context,
          //       //     builder: (context) => AlertDialog(
          //       //       content: DropdownButtonHideUnderline(
          //       //         child: DropdownButton(
          //       //           value: selectedUserId,
          //       //           icon: const Icon(Icons.keyboard_arrow_down),
          //       //           hint: Text(
          //       //             "Enter User",
          //       //             style: AppTextStyle.subTitle(),
          //       //           ),
          //       //           items: OrderCubit.get(context)
          //       //               .order!
          //       //               .users!
          //       //               .map((e) => DropdownMenuItem(
          //       //                     child: Text(
          //       //                       e.name!,
          //       //                       style: AppTextStyle.bodyText(),
          //       //                     ),
          //       //                     value: e.id,
          //       //                   ))
          //       //               .toList(),
          //       //           onChanged: (value) {
          //       //             setState(() {
          //       //               selectedUserId = int.parse(value.toString());
          //       //             });
          //       //           },
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   );
          //       // },
          //     }),
        ],
      ),
    );
  }
}
