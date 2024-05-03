import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/view/user/addresses/domain/repository/base_addresses_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../repository/base_favorites_repository.dart';

class GetFavorites {
  final BaseFavoritesRepository baseFavoritesRepository;

  GetFavorites(this.baseFavoritesRepository);

  Future<Either<Failure, FavoritesModel>> execute() async {
    return await baseFavoritesRepository.getFavorites();
  }
}
