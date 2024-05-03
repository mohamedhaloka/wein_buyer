part of 'return_policy_cubit.dart';

@immutable
abstract class ReturnPolicyState {}

class ReturnPolicyInitial extends ReturnPolicyState {}

class GetReturnPolicyLoaded extends ReturnPolicyState {}

class GetReturnPolicyLoading extends ReturnPolicyState {}

class GetReturnPolicyError extends ReturnPolicyState {}

class ChangeStatusUiReturnPolicyState extends ReturnPolicyState {}

class UpdateReturnPolicyLoaded extends ReturnPolicyState {}

class UpdateReturnPolicyLoading extends ReturnPolicyState {}

class UpdateReturnPolicyError extends ReturnPolicyState {}