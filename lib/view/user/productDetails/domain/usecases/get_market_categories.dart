import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/categories_item_model.dart';
import '../repository/base_product_details_repository.dart';

class GetMarketCategories{
  final BaseProductDetailsRepository baseProductDetailsRepository;

  GetMarketCategories(this.baseProductDetailsRepository);

  Future<Either<Failure, CategoriesItemModel>> execute(int marketId) async {
    return await baseProductDetailsRepository.getMarketCategories(marketId);
  }
}