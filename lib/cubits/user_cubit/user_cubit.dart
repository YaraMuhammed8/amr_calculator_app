import 'package:amr_calculator_app/models/order.dart';
import 'package:amr_calculator_app/models/user.dart';
import 'package:amr_calculator_app/models/user_item.dart';
import 'package:amr_calculator_app/services/sql_helper/sql_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);


  void addUser({
    required User user,
  }) {
    emit(LoadingAddUserState());
    SqlHelper.insertUser(
      user: user,
    ).then((value) {
      emit(SuccessAddUserState());
    }).catchError((error) {
      emit(ErrorAddUserState(message: error.toString()));
    });
  }

  User? user;
  void addItemToUser(UserItem userItem) {
    SqlHelper.insertUserItem(
      userItem: userItem,
    ).then((value) {
      SqlHelper.getDataOfTableWithId(
        tableName: SqlHelper.userTableName,
        id: userItem.userId!,
      ).then((value) {
        user = User.fromLocalDB(value.single);
      });
    });
  }
}
