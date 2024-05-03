import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';
import '../repository/base_products_repository.dart';

class GetProductBySubCategory {
  final BaseProductsRepository baseProductsRepository;

  GetProductBySubCategory(this.baseProductsRepository);

  Future<Either<Failure, ProductsModel>> execute(int subCateId) async {
    return await baseProductsRepository.getProductBySubCategory(subCateId);
  }
}
