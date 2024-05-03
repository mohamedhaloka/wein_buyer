import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/user_user_model.dart';
import '../../data/model/register_model.dart';

abstract class BaseRegisterUserRepository {
  Future<Either<Failure, UserUserModel>> register(RegisterModel registerModel);
}
