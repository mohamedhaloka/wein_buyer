import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/profile_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../data/model/edit_profile_data_model.dart';

abstract class BaseEditProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfileData();
  Future<Either<Failure, UserUserModel>> updateProfileData(EditProfileDataModel editProfileDataModel);
  Future<Either<Failure, bool>> updatePassword(String oldPass, String newPass, String confirmPass);
  Future<Either<Failure, bool>> deleteAccount();
}
