import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/profile_model.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/repository/base_edit_profile_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../data/model/edit_profile_data_model.dart';


class UpdatePassword {
  final BaseEditProfileRepository baseEditProfileRepository;

  UpdatePassword(this.baseEditProfileRepository);

  Future<Either<Failure, bool>> execute(String oldPass, String newPass, String confirmPass) async {
    return await baseEditProfileRepository.updatePassword(oldPass, newPass,confirmPass);
  }
}
