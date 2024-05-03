import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../domain/repository/base_account_repository.dart';
import '../datasource/account_remote_datasource.dart';

class AccountRepository extends BaseAccountRepository {
  final BaseAccountRemoteDatasource baseAccountRemoteDatasource;

  AccountRepository(this.baseAccountRemoteDatasource);

  @override
  Future<Either<Failure, bool>> contactUs(name, email, phone, msg) async {
    try {
      final res = await baseAccountRemoteDatasource.contactUs(name, email, phone, msg);
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
  Future<Either<Failure, bool>> deleteAccount() async{
    try {
      final res = await baseAccountRemoteDatasource.deleteAccount();
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
