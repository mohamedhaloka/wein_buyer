import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_user_model.dart';

abstract class BaseAccountRepository {
  Future<Either<Failure, bool>> contactUs(String name, String email,String phone, String msg);
  Future<Either<Failure, bool>> deleteAccount();
}
