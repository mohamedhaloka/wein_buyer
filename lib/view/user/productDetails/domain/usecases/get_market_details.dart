import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/market_details_model.dart';
import '../repository/base_product_details_repository.dart';

class GetMarketDetails{
  final BaseProductDetailsRepository baseProductDetailsRepository;

  GetMarketDetails(this.baseProductDetailsRepository);

  Future<Either<Failure, MarketDetails>> execute(int marketId) async {
    return await baseProductDetailsRepository.getMarketDetails(marketId);
  }
}