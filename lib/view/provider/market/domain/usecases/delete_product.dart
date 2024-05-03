import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';

class DeleteProduct {
  final BaseMarketRepository baseMarketRepository;

  DeleteProduct(this.baseMarketRepository);

  Future<Either<Failure, bool>> execute(int productId) async {
    return await baseMarketRepository.deleteProduct(productId);
  }
}
