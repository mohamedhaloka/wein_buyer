import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';
import '../repository/base_products_repository.dart';

class GetAllFreeDelivery {
  final BaseProductsRepository baseProductsRepository;

  GetAllFreeDelivery(this.baseProductsRepository);

  Future<Either<Failure, ProductsModel>> execute(int page) async {
    return await baseProductsRepository.getFreeDelivery(page);
  }
}
