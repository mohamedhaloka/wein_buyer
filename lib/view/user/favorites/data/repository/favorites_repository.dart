import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../domain/repository/base_favorites_repository.dart';
import '../datasource/favorites_remote_datasource.dart';

class FavoritesRepository extends BaseFavoritesRepository {
  final BaseFavoritesRemoteDatasource baseFavoritesRemoteDatasource;

  FavoritesRepository(this.baseFavoritesRemoteDatasource);

  @override
  Future<Either<Failure, FavoritesModel>> getFavorites() async{
    try {
      final res = await baseFavoritesRemoteDatasource.getFavorites();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> addFavoriteItem(int productId) async{
    try {
      final res = await baseFavoritesRemoteDatasource.addFavoriteItem(productId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavoriteItem(int productId) async{
    try {
      final res = await baseFavoritesRemoteDatasource.removeFavoriteItem(productId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
