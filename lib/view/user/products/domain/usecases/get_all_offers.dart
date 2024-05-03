import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/products_model.dart';
import '../repository/base_products_repository.dart';

class GetAllOffers {
  final BaseProductsRepository baseProductsRepository;

  GetAllOffers(this.baseProductsRepository);

  Future<Either<Failure, ProductsModel>> execute(int page) async {
    return await baseProductsRepository.getAllOffers(page);
  }
}
