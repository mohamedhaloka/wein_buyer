part of 'delivery_cost_cubit.dart';

@immutable
abstract class DeliveryCostState {}

class DeliveryCostInitial extends DeliveryCostState {}

class GetDeliveryCostLoaded extends DeliveryCostState {}

class GetDeliveryCostLoading extends DeliveryCostState {}

class GetDeliveryCostError extends DeliveryCostState {}

class ChangeStatusUiDeliveryCostState extends DeliveryCostState {}

class UpdateDeliveryCostLoaded extends DeliveryCostState {}

class UpdateDeliveryCostLoading extends DeliveryCostState {}

class UpdateDeliveryCostError extends DeliveryCostState {}
