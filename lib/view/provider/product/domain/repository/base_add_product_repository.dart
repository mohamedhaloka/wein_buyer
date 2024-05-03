import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/add_product_model.dart';
import '../../../../../../core/models/product_details_model.dart';

abstract class BaseAddProductRepository {
  Future<Either<Failure, ProductDetailsModel>> addProduct(
      AddProductModel addProductModel);

  Future<Either<Failure, ProductDetailsModel>> editProduct(
      AddProductModel addProductModel, int productId);

  Future<Either<Failure, bool>> deleteImages(int productId, String imgUrl);
}
