import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/my_rates_model.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/models/profile_provider_model.dart';
import 'package:wein_buyer/view/provider/market/data/model/edit_market_details.dart';
import '../../../../../../core/error/exception.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/models/sub_categories_provider_model.dart';
import '../../domain/repository/base_market_repository.dart';
import '../datasource/market_remote_datasource.dart';

class MarketRepository extends BaseMarketRepository {
  final BaseMarketRemoteDatasource baseMarketRemoteDatasource;

  MarketRepository(this.baseMarketRemoteDatasource);

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      final res = await baseMarketRemoteDatasource.getProfileData();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, SubCategoriesModel>> getSubCategories(int cateId) async {
    try {
      final res = await baseMarketRemoteDatasource.getSubCategories(cateId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getAllCategories() async {
    try {
      final res = await baseMarketRemoteDatasource.getAllCategories();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, ProductsModel>> getProducts(int cateId) async {
    try {
      final res = await baseMarketRemoteDatasource.getProducts(cateId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, MyRatesModel>> getMyRate() async {
    try {
      final res = await baseMarketRemoteDatasource.getMyRate();
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(int productId) async {
    try {
      final res = await baseMarketRemoteDatasource.deleteProduct(productId);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }

  @override
  Future<Either<Failure, bool>> editMarketDetails(
      EditMarketDetailsModel editMarketDetailsModel) async {
    try {
      final res = await baseMarketRemoteDatasource.editMarketDetails(editMarketDetailsModel);
      return Right(res);
    } on ServerException catch (e) {
      String? err;
      e.errorMessageModel.errors!.forEach((e) {
        err = '$e -';
      });
      return Left(ServerFailure(err!));
    }
  }
}
