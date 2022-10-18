
import 'package:amr_calculator_app/view/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_theme.dart';
import '../cubits/navigation_bar_cubit/navigation_bar_cubit.dart';
import '../cubits/order_cubit/order_cubit.dart';
import '../cubits/user_cubit/user_cubit.dart';
import '../view/restaurants/restaurants_view.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (BuildContext context) => NavigationBarCubit(),),
        BlocProvider(create: (BuildContext context) => UserCubit(),),
        BlocProvider(create: (BuildContext context) => OrderCubit(),),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) =>  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: FirstView(),
        ),
      ),
    );
  }
}
