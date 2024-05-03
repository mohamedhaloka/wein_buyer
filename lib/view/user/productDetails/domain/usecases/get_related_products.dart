import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/productDetails/domain/repository/base_product_details_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/related_products_model.dart';

class GetRelatedProducts {
  final BaseProductDetailsRepository baseProductDetailsRepository;

  GetRelatedProducts(this.baseProductDetailsRepository);

  Future<Either<Failure, RelatedProductsModel>> execute(int productId) async {
    return await baseProductDetailsRepository.getRelatedProducts(productId);
  }
}
