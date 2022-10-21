part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
////////////////////////////////////////////////////////////////////////////////
class LoadingAddItemState extends UserState {}

class SuccessAddItemState extends UserState {}

class ErrorAddItemState extends UserState {
  final String message;
  ErrorAddItemState({
    required this.message,
  });
}
////////////////////////////////////////////////////////////////////////////////

class LoadingUpdateCheckPriceState extends UserState {}

class SuccessUpdateCheckPriceState extends UserState {}

class ErrorUpdateCheckPriceState extends UserState {
  final String message;
  ErrorUpdateCheckPriceState({
    required this.message,
  });
}

////////////////////////////////////////////////////////////////////////////////

class LoadingAddUserState extends UserState {}

class SuccessAddUserState extends UserState {}

class ErrorAddUserState extends UserState {
  final String message;
  ErrorAddUserState({
    required this.message,
  });
}
