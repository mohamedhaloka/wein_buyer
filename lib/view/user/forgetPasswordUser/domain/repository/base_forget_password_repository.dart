import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/forget_password_model.dart';
import '../../../../../../../core/models/msg_model.dart';
import '../../../../../../../core/models/user_user_model.dart';

abstract class BaseForgetPasswordUserRepository {
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(String email);

  Future<Either<Failure, ForgetPasswordModel>> verificationCode(String code);

  Future<Either<Failure, MsgModel>> changePassword(
      String code, String password, String passwordConfirmation);
}
