import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/addresses_model.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../../../../../../core/models/user_user_model.dart';

abstract class BaseFavoritesRepository {
  Future<Either<Failure, FavoritesModel>> getFavorites();

  Future<Either<Failure, bool>> addFavoriteItem(int productId);

  Future<Either<Failure, bool>> removeFavoriteItem(int productId);
}
