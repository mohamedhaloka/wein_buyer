import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/my_rates_model.dart';
import '../../../../../../core/models/user_user_model.dart';

abstract class BaseReturnPolicyRepository {
  Future<Either<Failure, String>> getReturnPolicy();
  Future<Either<Failure, bool>> updateReturnPolicy(String content);
}
