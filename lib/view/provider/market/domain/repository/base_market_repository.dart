import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/models/profile_provider_model.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/my_rates_model.dart';
import '../../../../../../core/models/sub_categories_provider_model.dart';
import '../../data/model/edit_market_details.dart';

abstract class BaseMarketRepository {
  Future<Either<Failure, ProfileModel>> getProfileData();
  Future<Either<Failure, CategoriesModel>> getAllCategories();
  Future<Either<Failure, SubCategoriesModel>> getSubCategories(int cateId);
  Future<Either<Failure, ProductsModel>> getProducts(int cateId);
  Future<Either<Failure, MyRatesModel>> getMyRate();
  Future<Either<Failure, bool>> deleteProduct(int productId);
  Future<Either<Failure, bool>> editMarketDetails(EditMarketDetailsModel editMarketDetailsModel);
}
