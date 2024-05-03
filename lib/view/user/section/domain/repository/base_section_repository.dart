import 'package:dartz/dartz.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/addresses_model.dart';
import '../../../../../../../core/models/favorites_model.dart';
import '../../../../../../../core/models/main_categories_model.dart';
import '../../../../../../../core/models/sub_categories_model.dart';
import '../../../../../../../core/models/user_user_model.dart';

abstract class BaseSectionRepository {
  Future<Either<Failure, MainCategoriesModel>> getMainCates();

  Future<Either<Failure, SubCategoriesModel>> getSubCatesAndTopRatedProducts(
      int cateId);
}
