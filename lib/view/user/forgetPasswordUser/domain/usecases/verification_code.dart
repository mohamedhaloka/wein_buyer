import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/forget_password_model.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../repository/base_forget_password_repository.dart';

class VerificationCodeUser {
  final BaseForgetPasswordUserRepository baseForgetPasswordRepository;

  VerificationCodeUser(this.baseForgetPasswordRepository);

  Future<Either<Failure, ForgetPasswordModel>> execute(String code) async {
    return await baseForgetPasswordRepository.verificationCode(code);
  }
}
