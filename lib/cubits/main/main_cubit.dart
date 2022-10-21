import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/restaurant.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  List<Restaurant> restaurants = [
    Restaurant(imagePath: "assets/images/abo_anas.png", name: "ابو انس"),
    Restaurant(imagePath: "assets/images/koshary_hind.png", name: "كشري هند"),
  ];
}
