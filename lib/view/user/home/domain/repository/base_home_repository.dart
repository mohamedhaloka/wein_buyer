import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/home_model.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/user_user_model.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData();
}
