part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}
class GetProductDetailsLoaded extends ProductDetailsState {}
class GetProductDetailsLoading extends ProductDetailsState {}
class GetProductDetailsError extends ProductDetailsState {}

class GetRelatedProductsLoaded extends ProductDetailsState {}
class GetRelatedProductsLoading extends ProductDetailsState {}
class GetRelatedProductsError extends ProductDetailsState {}

class AddToCartLoaded extends ProductDetailsState {}
class AddToCartLoading extends ProductDetailsState {}
class AddToCartError extends ProductDetailsState {}

class GetMarketDetailsLoaded extends ProductDetailsState {}
class GetMarketDetailsLoading extends ProductDetailsState {}
class GetMarketDetailsError extends ProductDetailsState {}

class GetMarketCategoriesLoaded extends ProductDetailsState {}
class GetMarketCategoriesLoading extends ProductDetailsState {}
class GetMarketCategoriesError extends ProductDetailsState {}

class GetMarketProductsLoaded extends ProductDetailsState {}
class GetMarketProductsLoading extends ProductDetailsState {}
class GetMarketProductsError extends ProductDetailsState {}

class IncreaseQuantityState extends ProductDetailsState {}
class DecreaseQuantityState extends ProductDetailsState {}
class ChangeTabButtonsState extends ProductDetailsState {}
