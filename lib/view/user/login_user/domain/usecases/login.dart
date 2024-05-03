import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../repository/base_login_repository.dart';

class LoginUser {
  final BaseLoginUserRepository baseLoginRepository;

  LoginUser(this.baseLoginRepository);

  Future<Either<Failure, UserUserModel>> execute(
      String phone, String password) async {
    return await baseLoginRepository.login(phone, password);
  }
}
