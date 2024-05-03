import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../domain/repository/base_setting_market_repository.dart';
import '../datasource/setting_market_remote_datasource.dart';

class SettingMarketRepository extends BaseSettingMarketRepository {
  final BaseSettingMarketRemoteDatasource baseSettingMarketRemoteDatasource;

  SettingMarketRepository(this.baseSettingMarketRemoteDatasource);

  @override
  Future<Either<Failure, bool>> toggleOpenStatus() async {
    try {
      final res = await baseSettingMarketRemoteDatasource.toggleOpenStatus();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
