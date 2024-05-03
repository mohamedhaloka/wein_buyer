import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/forget_password_model.dart';
import '../repository/base_forget_password_repository.dart';

class ForgetPasswordUser{
  final BaseForgetPasswordUserRepository baseForgetPasswordRepository;

  ForgetPasswordUser(this.baseForgetPasswordRepository);

  Future<Either<Failure, ForgetPasswordModel>> execute(
      String email) async {
    return await baseForgetPasswordRepository.forgetPassword(email);
  }
}