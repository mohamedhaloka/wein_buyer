import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/my_rates_model.dart';

class GetMyRates {
  final BaseMarketRepository baseMarketRepository;

  GetMyRates(this.baseMarketRepository);

  Future<Either<Failure, MyRatesModel>> execute() async {
    return await baseMarketRepository.getMyRate();
  }
}
