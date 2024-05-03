import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../domain/repository/base_return_policy_repository.dart';
import '../datasource/return_policy_remote_datasource.dart';

class ReturnPolicyRepository extends BaseReturnPolicyRepository {
  final BaseReturnPolicyRemoteDatasource baseReturnPolicyRemoteDatasource;

  ReturnPolicyRepository(this.baseReturnPolicyRemoteDatasource);

  @override
  Future<Either<Failure, String>> getReturnPolicy() async {
    try {
      final res = await baseReturnPolicyRemoteDatasource.getReturnPolicy();
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
  Future<Either<Failure, bool>> updateReturnPolicy(String content) async{
    try {
      final res = await baseReturnPolicyRemoteDatasource.updateReturnPolicy(content);
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
