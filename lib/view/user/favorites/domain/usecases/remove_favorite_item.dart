import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/view/user/addresses/domain/repository/base_addresses_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../repository/base_favorites_repository.dart';

class RemoveFavoriteItem {
  final BaseFavoritesRepository baseFavoritesRepository;

  RemoveFavoriteItem(this.baseFavoritesRepository);

  Future<Either<Failure, bool>> execute(int productId) async {
    return await baseFavoritesRepository.removeFavoriteItem(productId);
  }
}
