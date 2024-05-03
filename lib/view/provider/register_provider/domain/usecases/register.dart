import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/register_provider/data/model/register_model.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../../../../core/models/user_provider_model.dart';
import '../repository/base_register_repository.dart';

class Register {
  final BaseRegisterRepository baseRegisterRepository;

  Register(this.baseRegisterRepository);

  Future<Either<Failure, UserProviderModel>> execute(
      RegisterModel registerModel) async {
    return await baseRegisterRepository.register(registerModel);
  }
}
