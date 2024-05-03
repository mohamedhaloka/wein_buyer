part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class GetProductsLoaded extends ProductsState {}
class GetProductsLoading extends ProductsState {}
class GetProductsError extends ProductsState {}

class GetAllOffersLoaded extends ProductsState {}
class GetAllOffersLoading extends ProductsState {}
class GetAllOffersError extends ProductsState {}

class GetAllFreeDeliveryLoaded extends ProductsState {}
class GetAllFreeDeliveryLoading extends ProductsState {}
class GetAllFreeDeliveryError extends ProductsState {}

class OnTapOnSortItemState extends ProductsState {}
