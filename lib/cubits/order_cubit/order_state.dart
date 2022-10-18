part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
///////////////////////////////////////////////////////////////////////////////
class LoadingMakeOrderState extends OrderState {}

class SuccessMakeOrderState extends OrderState {}

class ErrorMakeOrderState extends OrderState {
  final String message;
  ErrorMakeOrderState({
    required this.message,
  });
}
