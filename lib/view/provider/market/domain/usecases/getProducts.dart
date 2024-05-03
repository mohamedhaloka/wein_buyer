import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';

class GetProducts {
  final BaseMarketRepository baseMarketRepository;

  GetProducts(this.baseMarketRepository);

  Future<Either<Failure, ProductsModel>> execute(int cateId) async {
    return await baseMarketRepository.getProducts(cateId);
  }
}
