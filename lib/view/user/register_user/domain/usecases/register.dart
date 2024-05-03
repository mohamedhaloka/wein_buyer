import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../data/model/register_model.dart';
import '../repository/base_register_repository.dart';

class RegisterUser {
  final BaseRegisterUserRepository baseRegisterRepository;

  RegisterUser(this.baseRegisterRepository);

  Future<Either<Failure, UserUserModel>> execute(
      RegisterModel registerModel) async {
    return await baseRegisterRepository.register(registerModel);
  }
}
