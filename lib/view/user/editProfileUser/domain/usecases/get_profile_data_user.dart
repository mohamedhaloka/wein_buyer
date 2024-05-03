import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/profile_model.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/repository/base_edit_profile_repository.dart';
import '../../../../../../../core/error/failure.dart';


class GetProfileDataUser {
  final BaseEditProfileRepository baseEditProfileRepository;

  GetProfileDataUser(this.baseEditProfileRepository);

  Future<Either<Failure, ProfileModel>> execute() async {
    return await baseEditProfileRepository.getProfileData();
  }
}
