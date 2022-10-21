import 'package:amr_calculator_app/core/components/default_button.dart';
import 'package:amr_calculator_app/core/utils/naviagtion.dart';
import 'package:amr_calculator_app/view/menu/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/components/text_form_field.dart';
import '../../core/styles/app_text_style.dart';
import '../../core/toast/toast.dart';
import '../../cubits/user/user_cubit.dart';
import '../../enums/ToostStates.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({Key? key}) : super(key: key);
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add User",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter name",
                style: AppTextStyle.title(),
              ),
              SizedBox(
                height: 20.h,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.name,
                controller: nameController,
                hasBorder: false,
                isFilled: true,
                fillColor: Colors.grey.shade200,
              ),
              SizedBox(
                height: 40.h,
              ),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is SuccessAddUserState) {
                    Fluttertoast.showToast(
                        msg: "Added successfully",
                        backgroundColor: chooseToastColor(ToastStates.Success));
                  } else if (state is ErrorAddUserState) {
                    Fluttertoast.showToast(
                        msg: state.message,
                        backgroundColor: chooseToastColor(ToastStates.Success));
                  }
                },
                builder: (context, state) {
                  return state is LoadingAddUserState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: DefaultButton(
                              width: 100.w,
                              height: 40.h,
                              borderRadius: 10.r,
                              onPress: () {
                                AppNavigator.customNavigator(
                                    context: context,
                                    screen: MenuScreen(),
                                    finish: false);
                                // if (nameController.text.isNotEmpty) {
                                //   User user = User(
                                //       name: nameController.text,
                                //       checkPrice: 0,
                                //       isCheck: 0,
                                //       totalPrice: 0);
                                //   UserCubit.get(context).addUser(user: user);
                                // }
                              },
                              text: "Add"),
                        );
                },
              )
            ],
          ),
        ));
  }
}
