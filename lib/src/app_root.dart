import 'package:amr_calculator_app/cubits/order/order_cubit.dart';
import 'package:amr_calculator_app/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/app_theme.dart';
import '../cubits/main/main_cubit.dart';
import '../cubits/user/user_cubit.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => MainCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => OrderCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
