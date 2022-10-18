import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/general_button.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../cubits/order_cubit/order_cubit.dart';

class CardItem extends StatefulWidget {
  const CardItem(
      {Key? key,
      required this.txt,
      required this.imgPath,
      required this.fun,
      required this.price})
      : super(key: key);

  final String txt;
  final String imgPath;
  final fun;
  final double price;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  int? selectedUserId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // boxShadow: [
          //   BoxShadow(
          //       offset: const Offset(5, 5),
          //       blurRadius: 10,
          //       color: Colors.grey.shade300)
          //]
        ),
        child: Column(
          children: [
            Image.asset(
              widget.imgPath,
              height: 80.h,
            ),
            Text(
              widget.txt,
              style: AppTextStyle.bodyText(),
              textDirection: TextDirection.rtl,
            ),
            Text("${widget.price}",
                style: AppTextStyle.subTitle().copyWith(color: Colors.black)),
            const Spacer(),
            GeneralButton(
              text: "Add",
              function: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedUserId,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        hint: Text(
                          "Enter User",
                          style: AppTextStyle.subTitle(),
                        ),
                        items: OrderCubit.get(context)
                            .order!
                            .users!
                            .map((e) => DropdownMenuItem(
                                  child: Text(
                                    e.name!,
                                    style: AppTextStyle.bodyText(),
                                  ),
                                  value: e.id,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedUserId = int.parse(value.toString());
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
