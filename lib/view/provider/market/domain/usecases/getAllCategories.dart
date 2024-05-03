import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';

class GetAllCategories {
  final BaseMarketRepository baseMarketRepository;

  GetAllCategories(this.baseMarketRepository);

  Future<Either<Failure, CategoriesModel>> execute() async {
    return await baseMarketRepository.getAllCategories();
  }
}
