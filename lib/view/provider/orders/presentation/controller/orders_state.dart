part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class GetOrdersLoading extends OrdersState {}

class GetOrdersLoaded extends OrdersState {}

class GetOrdersError extends OrdersState {}
