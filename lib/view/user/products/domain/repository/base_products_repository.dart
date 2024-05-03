import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, ProductsModel>> getProductBySubCategory(int subCateId);

  Future<Either<Failure, ProductsModel>> getProductBySortFilter(
      int subCateId, String keyOfFilter);

  Future<Either<Failure, ProductsModel>> getProductBySortMaxAndMin(
      int subCateId,
      String maxPrice,
      String minPrice,
      String minDistance,
      String maxDistance);

  Future<Either<Failure, ProductsModel>> getAllOffers(int page);

  Future<Either<Failure, ProductsModel>> getFreeDelivery(int page);

}
