import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/profile_model.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/repository/base_edit_profile_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../core/models/user_user_model.dart';
import '../../data/model/edit_profile_data_model.dart';


class UpdateProfileData {
  final BaseEditProfileRepository baseEditProfileRepository;

  UpdateProfileData(this.baseEditProfileRepository);

  Future<Either<Failure, UserUserModel>> execute(EditProfileDataModel editProfileDataModel) async {
    return await baseEditProfileRepository.updateProfileData(editProfileDataModel);
  }
}
