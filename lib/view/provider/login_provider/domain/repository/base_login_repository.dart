import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_provider_model.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, UserProviderModel>> login(String email, String password);
}
