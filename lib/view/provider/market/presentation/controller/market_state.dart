part of 'market_cubit.dart';

@immutable
abstract class MarketState {}

class MarketInitial extends MarketState {}

class ChangeTabButtonsState extends MarketState {}

class GetAllCategoriesLoading extends MarketState {}

class GetAllCategoriesError extends MarketState {}

class GetCategoriesLoaded extends MarketState {}

class GetProductsLoading extends MarketState {}

class GetProductsError extends MarketState {}

class GetProductsLoaded extends MarketState {}

class GetMyRatesLoading extends MarketState {}

class GetMyRatesError extends MarketState {}

class GetMyRatesLoaded extends MarketState {}

class DeleteProductLoading extends MarketState {}

class DeleteProductError extends MarketState {}

class DeleteProductLoaded extends MarketState {}

class EditMarketDetailsLoading extends MarketState {}

class EditMarketDetailsError extends MarketState {}

class EditMarketDetailsLoaded extends MarketState {}

class GetProfileDataLoading extends MarketState {}

class GetProfileDataError extends MarketState {}

class GetProfileDataLoaded extends MarketState {}

class GetHeaderDataLoading extends MarketState {}

class GetHeaderDataError extends MarketState {}

class GetHeaderDataLoaded extends MarketState {}

class SelectedImageState extends MarketState {}

class SelectedHeaderState extends MarketState {}
