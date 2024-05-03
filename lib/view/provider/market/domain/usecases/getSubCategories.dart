import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/sub_categories_provider_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';

class GetSubCategories {
  final BaseMarketRepository baseMarketRepository;

  GetSubCategories(this.baseMarketRepository);

  Future<Either<Failure, SubCategoriesModel>> execute(int cateId) async {
    return await baseMarketRepository.getSubCategories(cateId);
  }
}
