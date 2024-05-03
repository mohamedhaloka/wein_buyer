import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/sizes_model.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../domain/repository/base_utils_repository.dart';
import '../datasource/utils_remote_datasource.dart';

class UtilsRepository extends BaseUtilsRepository {
  final BaseUtilsRemoteDatasource baseUtilsRemoteDatasource;

  UtilsRepository(this.baseUtilsRemoteDatasource);

  @override
  Future<Either<Failure, SizesModel>> getSizes() async {
    try {
      final res = await baseUtilsRemoteDatasource.getSizes();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> getVerifiedStatus() async {
    try {
      final res = await baseUtilsRemoteDatasource.getVerifiedStatus();
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
