import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/forgetPassword/domain/repository/base_forget_password_repository.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/forget_password_model.dart';
import '../../../../../../core/models/user_user_model.dart';

class ForgetPassword{
  final BaseForgetPasswordRepository baseForgetPasswordRepository;

  ForgetPassword(this.baseForgetPasswordRepository);

  Future<Either<Failure, ForgetPasswordModel>> execute(
      String email) async {
    return await baseForgetPasswordRepository.forgetPassword(email);
  }
}