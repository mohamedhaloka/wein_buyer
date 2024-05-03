import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import '../../../../../../../core/error/failure.dart';
import '../repository/base_product_details_repository.dart';

class GetMarketProducts {
  final BaseProductDetailsRepository baseProductDetailsRepository;

  GetMarketProducts(this.baseProductDetailsRepository);

  Future<Either<Failure, ProductsModel>> execute(
      int marketId, int categoryId) async {
    return await baseProductDetailsRepository.getMarketProducts(
        marketId, categoryId);
  }
}
