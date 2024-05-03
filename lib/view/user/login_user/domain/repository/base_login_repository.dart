import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/user_user_model.dart';

abstract class BaseLoginUserRepository {
  Future<Either<Failure, UserUserModel>> login(String phone, String password);
}
