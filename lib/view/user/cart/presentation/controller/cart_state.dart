part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartLoaded extends CartState {}

class GetCartError extends CartState {}

class UpdateItemQuantityLoading extends CartState {}

class UpdateItemQuantityLoaded extends CartState {}

class UpdateItemQuantityError extends CartState {}

class RemoveItemLoading extends CartState {}

class RemoveItemLoaded extends CartState {}

class RemoveItemError extends CartState {}

class CheckoutLoading extends CartState {}

class CheckoutLoaded extends CartState {}

class CheckoutError extends CartState {}
