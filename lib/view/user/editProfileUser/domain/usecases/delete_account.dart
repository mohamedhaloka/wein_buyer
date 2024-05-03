import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/profile_model.dart';
import 'package:wein_buyer/view/user/editProfileUser/domain/repository/base_edit_profile_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../data/model/edit_profile_data_model.dart';


class DeleteAccount {
  final BaseEditProfileRepository baseEditProfileRepository;

  DeleteAccount(this.baseEditProfileRepository);

  Future<Either<Failure, bool>> execute() async {
    return await baseEditProfileRepository.deleteAccount();
  }
}
