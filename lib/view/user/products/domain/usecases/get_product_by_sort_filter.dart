import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';
import '../repository/base_products_repository.dart';

class GetProductBySortFilter {
  final BaseProductsRepository baseProductsRepository;

  GetProductBySortFilter(this.baseProductsRepository);

  Future<Either<Failure, ProductsModel>> execute(int subCateId, String keyOfFilter) async {
    return await baseProductsRepository.getProductBySortFilter(subCateId , keyOfFilter);
  }
}
