import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/productDetails/domain/repository/base_product_details_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/product_details.dart';

class GetProductDetails {
  final BaseProductDetailsRepository baseProductDetailsRepository;

  GetProductDetails(this.baseProductDetailsRepository);

  Future<Either<Failure, ProductDetails>> execute(int productId) async {
    return await baseProductDetailsRepository.getProductDetails(productId);
  }
}
