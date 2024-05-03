import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/forget_password_model.dart';
import '../../../../../../core/models/msg_model.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../repository/base_forget_password_repository.dart';

class ChangePassword {
  final BaseForgetPasswordRepository baseForgetPasswordRepository;

  ChangePassword(this.baseForgetPasswordRepository);

  Future<Either<Failure, MsgModel>> execute(
      String code, String password, String passwordConfirmation) async {
    return await baseForgetPasswordRepository.changePassword(
        code, password, passwordConfirmation);
  }
}
