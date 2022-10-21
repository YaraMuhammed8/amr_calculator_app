import 'package:amr_calculator_app/core/components/default_button.dart';
import 'package:amr_calculator_app/view/specials/special_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/text_form_field.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../models/item.dart';

class SpecialsScreen extends StatefulWidget {
  SpecialsScreen({Key? key, required this.item}) : super(key: key);
  Item item;

  @override
  State<SpecialsScreen> createState() => _SpecialsScreenState();
}

class _SpecialsScreenState extends State<SpecialsScreen> {
  double heightFactor = 0.75;
  int quantity = 1;
  List<String> specials = [];

  TextEditingController newSpecialController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: //to Detect Keyboard Open Close
            (MediaQuery.of(context).viewInsets.bottom == 0) ? 0.75 : 1,
        child: Padding(
          //to prevent keyboard from overlapping
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: AppColors.lightBackGroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 5),
                      blurRadius: 30,
                      color: Colors.grey.shade400)
                ]),
            child: Column(
              children: [
                Container(
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(width: 3, color: Colors.grey.shade300),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  widget.item.name!,
                  style: AppTextStyle.title(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "${widget.item.price} EGP",
                  style: AppTextStyle.title()
                      .copyWith(color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.grey.shade200,
                          child: const Text(
                            "-",
                            style: TextStyle(color: Colors.grey, fontSize: 30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          quantity.toString(),
                          style: AppTextStyle.bodyText(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColors.primaryColor,
                          child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.grey.shade200, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => SpecialItem(
                            text: specials[index],
                            delete: () {
                              setState(() {
                                specials.removeAt(index);
                              });
                            },
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10.h,
                          ),
                      itemCount: specials.length),
                ),
                DefaultTextFormField(
                  controller: newSpecialController,
                  textInputType: TextInputType.text,
                  hasBorder: false,
                  isFilled: false,
                  prefixIcon: Icons.add,
                  hintText: "add special",
                  textDirection: TextDirection.rtl,
                  onFilledSubmit: () {
                    if (newSpecialController.text.isNotEmpty) {
                      setState(() {
                        specials.add(newSpecialController.text);
                        newSpecialController.text = "";
                      });
                    }
                  },
                ),
                DefaultButton(
                  onPress: () {},
                  text: "Save",
                  borderRadius: 15.r,
                )
              ],
            ),
          ),
        ));
  }
}
