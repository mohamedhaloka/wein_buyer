import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';
import '../../data/model/edit_market_details.dart';

class EditMarketDetails {
  final BaseMarketRepository baseMarketRepository;

  EditMarketDetails(this.baseMarketRepository);

  Future<Either<Failure, bool>> execute(
      EditMarketDetailsModel editMarketDetailsModel) async {
    return await baseMarketRepository.editMarketDetails(editMarketDetailsModel);
  }
}
