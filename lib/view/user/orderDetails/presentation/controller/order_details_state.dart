part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsUserState {}

class OrderDetailsInitial extends OrderDetailsUserState {}
class CancelOrderUserLoading extends OrderDetailsUserState {}
class CancelOrderUserLoaded extends OrderDetailsUserState {}
class CancelOrderUserError extends OrderDetailsUserState {}
