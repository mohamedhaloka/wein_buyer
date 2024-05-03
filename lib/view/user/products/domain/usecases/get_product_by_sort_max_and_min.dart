import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';
import '../repository/base_products_repository.dart';

class GetProductBySortMaxAndMin {
  final BaseProductsRepository baseProductsRepository;

  GetProductBySortMaxAndMin(this.baseProductsRepository);

  Future<Either<Failure, ProductsModel>> execute(int subCateId, String maxPrice,
      String minPrice, String minDistance, String maxDistance) async {
    return await baseProductsRepository.getProductBySortMaxAndMin(
        subCateId, maxPrice, minPrice, minDistance, maxDistance);
  }
}
