part of 'my_orders_cubit.dart';

@immutable
abstract class MyOrdersState {}

class MyOrdersInitial extends MyOrdersState {}

class GetMyOrdersLoaded extends MyOrdersState {}

class GetMyOrdersLoading extends MyOrdersState {}

class GetMyOrdersError extends MyOrdersState {}

class RateProductLoaded extends MyOrdersState {}

class RateProductLoading extends MyOrdersState {}

class RateProductError extends MyOrdersState {}
