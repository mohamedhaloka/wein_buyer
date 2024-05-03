part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class GetFavoritesLoaded extends FavoritesState {}
class GetFavoritesLoading extends FavoritesState {}
class GetFavoritesError extends FavoritesState {}

class AddFavoriteItemLoaded extends FavoritesState {}
class AddFavoriteItemLoading extends FavoritesState {}
class AddFavoriteItemError extends FavoritesState {}

class RemoveFavoriteItemLoaded extends FavoritesState {}
class RemoveFavoriteItemLoading extends FavoritesState {}
class RemoveFavoriteItemError extends FavoritesState {}
