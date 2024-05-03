import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/editProfileUser/data/model/edit_profile_data_model.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/profile_model.dart';
import '../../../../../core/models/user_user_model.dart';
import '../../domain/repository/base_edit_profile_repository.dart';
import '../datasource/edit_profile_remote_datasource.dart';

class EditProfileRepository extends BaseEditProfileRepository {
  final BaseEditProfileRemoteDatasource baseEditProfileRemoteDatasource;

  EditProfileRepository(this.baseEditProfileRemoteDatasource);

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      final res = await baseEditProfileRemoteDatasource.getProfileData();
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
  Future<Either<Failure, UserUserModel>> updateProfileData(EditProfileDataModel editProfileDataModel) async{
    try {
      final res = await baseEditProfileRemoteDatasource.updateProfileData(editProfileDataModel);
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
  Future<Either<Failure, bool>> updatePassword(String oldPass, String newPass, String confirmPass) async{
    try {
      final res = await baseEditProfileRemoteDatasource.updatePassword(oldPass , newPass , confirmPass);
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
      final res = await baseEditProfileRemoteDatasource.deleteAccount();
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
