import 'package:amr_calculator_app/core/components/general_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../core/components/text_form_field.dart';
import '../../core/styles/app_text_style.dart';
import '../../core/toast/toast.dart';
import '../../cubits/order_cubit/order_cubit.dart';
import '../../cubits/user_cubit/user_cubit.dart';
import '../../enums/ToostStates.dart';
import '../../models/user.dart';

class AddUserView extends StatelessWidget {
  AddUserView({Key? key}) : super(key: key);
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
          padding: const EdgeInsets.all(20),
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
                height: 20.h,
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
                      : GeneralButton(
                          height: 40.h,
                          function: () {
                            if (nameController.text.isNotEmpty) {
                              User user = User(
                                  name: nameController.text,
                                  checkPrice: 0,
                                  isCheck: 0,
                                  totalPrice: 0);
                              UserCubit.get(context).addUser(user: user);
                            }
                          },
                          text: "Add");
                },
              )
            ],
          ),
        ));
  }
}
