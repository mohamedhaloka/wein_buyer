import 'package:dartz/dartz.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../../../../core/models/user_provider_model.dart';
import '../../domain/repository/base_register_repository.dart';
import '../datasource/register_remote_datasource.dart';

class RegisterRepository extends BaseRegisterRepository {
  final BaseRegisterRemoteDatasource baseRegisterRemoteDatasource;

  RegisterRepository(this.baseRegisterRemoteDatasource);

  @override
  Future<Either<Failure, UserProviderModel>> register(registerModel) async {
    try {
      final res = await baseRegisterRemoteDatasource.register(registerModel);
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
