import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/text_form_field.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../models/const.dart';
import 'card_item.dart';

class ItemsView extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  ItemsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextFormField(
              hintText: "Search item...",
              prefixIcon: Icons.search,
              controller: searchController,
              textInputType: TextInputType.text,
              isFilled: true,
              hasBorder: false,
              fillColor: Colors.white,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "All Menu",
              style: AppTextStyle.headLine(),
            ),
            SizedBox(
              height: 20.h,
            ),
            aboAnasItems == null
                ? const CircularProgressIndicator(color: AppColors.primaryColor)
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisExtent: 220,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: aboAnasItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardItem(
                          txt: aboAnasItems[index].name!,
                          imgPath: "assets/images/amr_face.png",
                          fun: () {},
                          price: aboAnasItems[index].price!);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
