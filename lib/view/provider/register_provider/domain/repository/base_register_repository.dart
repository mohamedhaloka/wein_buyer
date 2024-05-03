import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/provider/register_provider/data/model/register_model.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/user_user_model.dart';
import '../../../../../core/models/user_provider_model.dart';

abstract class BaseRegisterRepository {
  Future<Either<Failure, UserProviderModel>> register(RegisterModel registerModel);
}
