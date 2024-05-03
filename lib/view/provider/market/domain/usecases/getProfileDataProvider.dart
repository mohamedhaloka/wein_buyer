import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/profile_provider_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';

class GetProfileData {
  final BaseMarketRepository baseMarketRepository;

  GetProfileData(this.baseMarketRepository);

  Future<Either<Failure, ProfileModel>> execute() async {
    return await baseMarketRepository.getProfileData();
  }
}
