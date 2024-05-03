import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../domain/repository/base_login_repository.dart';
import '../datasource/login_remote_datasource.dart';

class LoginUserRepository extends BaseLoginUserRepository {
  final BaseLoginUserRemoteDatasource baseLoginRemoteDatasource;

  LoginUserRepository(this.baseLoginRemoteDatasource);

  @override
  Future<Either<Failure, UserUserModel>> login(phone, password) async {
    try {
      final res = await baseLoginRemoteDatasource.login(phone, password);
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
