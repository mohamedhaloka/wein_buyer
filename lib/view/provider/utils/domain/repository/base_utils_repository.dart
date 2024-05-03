import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/sizes_model.dart';

import '../../../../../../core/error/failure.dart';

abstract class BaseUtilsRepository {
  Future<Either<Failure, SizesModel>> getSizes();
  Future<Either<Failure, bool>> getVerifiedStatus();
}
