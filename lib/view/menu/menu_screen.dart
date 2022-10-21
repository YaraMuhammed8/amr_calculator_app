import 'package:amr_calculator_app/core/components/default_button.dart';
import 'package:amr_calculator_app/cubits/main/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/text_form_field.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../models/const.dart';
import 'card_item.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                "assets/images/abo_anas.png",
              ),
              radius: 20.r,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Abo Anas",
              style: AppTextStyle.appBarText(),
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocConsumer<MainCubit, MainState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = MainCubit.get(context);
                  return Column(
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
                          ? const CircularProgressIndicator(
                              color: AppColors.primaryColor)
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
                                    fun: () {}, item: aboAnasItems[index]);
                              },
                            ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DefaultButton(onPress: (){}, text: "Submit Order",borderRadius: 15.r,),
          ),
        ],
      ),
    );
  }
}
