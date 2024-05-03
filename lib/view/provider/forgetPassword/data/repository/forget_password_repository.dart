import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/forgetPassword/domain/repository/base_forget_password_repository.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/forget_password_model.dart';
import '../../../../../../core/models/msg_model.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../datasource/forget_password_remote_datasource.dart';

class ForgetPasswordRepository extends BaseForgetPasswordRepository {
  final BaseForgetPasswordRemoteDatasource baseForgetPasswordRemoteDatasource;

  ForgetPasswordRepository(this.baseForgetPasswordRemoteDatasource);

  @override
  Future<Either<Failure, MsgModel>> changePassword(
      code, password, passwordConfirmation) async {
    try {
      final res = await baseForgetPasswordRemoteDatasource.changePassword(
          code, password, passwordConfirmation);
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
  Future<Either<Failure, ForgetPasswordModel>> verificationCode(code) async {
    try {
      final res =
          await baseForgetPasswordRemoteDatasource.verificationCode(code);
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
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(email) async {
    try {
      final res =
          await baseForgetPasswordRemoteDatasource.forgetPassword(email);
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
