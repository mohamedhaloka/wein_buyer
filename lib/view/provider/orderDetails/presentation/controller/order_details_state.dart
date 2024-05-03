part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class AcceptOrderLoaded extends OrderDetailsState {}
class AcceptOrderLoading extends OrderDetailsState {}
class AcceptOrderError extends OrderDetailsState {}

class RejectOrderLoaded extends OrderDetailsState {}
class RejectOrderLoading extends OrderDetailsState {}
class RejectOrderError extends OrderDetailsState {}

class CancelOrderLoaded extends OrderDetailsState {}
class CancelOrderLoading extends OrderDetailsState {}
class CancelOrderError extends OrderDetailsState {}

class DeliverOrderLoaded extends OrderDetailsState {}
class DeliverOrderLoading extends OrderDetailsState {}
class DeliverOrderError extends OrderDetailsState {}
