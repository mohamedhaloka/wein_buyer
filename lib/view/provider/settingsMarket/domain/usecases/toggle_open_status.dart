import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/settingsMarket/domain/repository/base_setting_market_repository.dart';
import '../../../../../../core/error/failure.dart';

class ToggleOpenStatus {
  final BaseSettingMarketRepository baseSettingMarketRepository;

  ToggleOpenStatus(this.baseSettingMarketRepository);

  Future<Either<Failure, bool>> execute() async {
    return await baseSettingMarketRepository.toggleOpenStatus();
  }
}
