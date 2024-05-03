import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/home_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../domain/repository/base_home_repository.dart';
import '../datasource/home_remote_datasource.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDatasource baseHomeRemoteDatasource;

  HomeRepository(this.baseHomeRemoteDatasource);

  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      final res = await baseHomeRemoteDatasource.getHomeData();
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
