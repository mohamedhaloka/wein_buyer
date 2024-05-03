import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_provider_model.dart';
import '../repository/base_login_repository.dart';

class Login {
  final BaseLoginRepository baseLoginRepository;

  Login(this.baseLoginRepository);

  Future<Either<Failure, UserProviderModel>> execute(
      String email, String password) async {
    return await baseLoginRepository.login(email, password);
  }
}
