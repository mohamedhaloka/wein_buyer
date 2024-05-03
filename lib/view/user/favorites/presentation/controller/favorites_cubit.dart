import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/view/user/favorites/domain/usecases/get_favorites.dart';
import 'package:wein_buyer/view/user/favorites/domain/usecases/remove_favorite_item.dart';
import '../../../../../../../core/models/product.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../domain/usecases/add_favorite_item.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.getFavoritesUseCase, this.addFavoriteItemUseCase,
      this.removeFavoriteItemUseCase)
      : super(FavoritesInitial());

  static FavoritesCubit of(context) => BlocProvider.of(context);

  final GetFavorites getFavoritesUseCase;
  final AddFavoriteItem addFavoriteItemUseCase;
  final RemoveFavoriteItem removeFavoriteItemUseCase;

  List<Product> listOfFavorites = [];

  Future removeFavoriteItem(int productId) async {
    emit(RemoveFavoriteItemLoading());
    final res = await removeFavoriteItemUseCase.execute(productId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(RemoveFavoriteItemError());
      },
      (res) async {
        emit(RemoveFavoriteItemLoaded());
      },
    );
  }

  Future addFavoriteItem(int productId) async {
    emit(AddFavoriteItemLoading());
    final res = await addFavoriteItemUseCase.execute(productId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddFavoriteItemError());
      },
      (res) async {
        emit(AddFavoriteItemLoaded());
      },
    );
  }

  Future getFavorites() async {
    emit(GetFavoritesLoading());
    final res = await getFavoritesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetFavoritesError());
      },
      (res) async {
        listOfFavorites.addAll(res.body ?? []);
        emit(GetFavoritesLoaded());
      },
    );
  }
}
