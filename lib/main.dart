import 'package:amr_calculator_app/services/sql_helper/sql_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'cubits/observer/bloc_observer.dart';
import 'src/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SqlHelper.initDB();
  Bloc.observer = MyBlocObserver();
  runApp(const AppRoot());
}
