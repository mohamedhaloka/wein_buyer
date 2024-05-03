import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/currencies_model.dart';
import '../../../../../../../core/error/exception.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/fqs_model.dart';
import '../../../../../../../core/models/privacy_policy_model.dart';
import '../../../../../../../core/models/terms_model.dart';
import '../../domain/repository/base_pages_repository.dart';
import '../datasource/pages_remote_datasource.dart';

class PagesRepository extends BasePagesRepository {
  final BasePagesRemoteDatasource basePagesRemoteDatasource;

  PagesRepository(this.basePagesRemoteDatasource);

  @override
  Future<Either<Failure, FqsModel>> getFaqs() async{
    try {
      final res = await basePagesRemoteDatasource.getFaqs();
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
  Future<Either<Failure, TermsModel>> getTerms() async{
    try {
      final res = await basePagesRemoteDatasource.getTerms();
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
  Future<Either<Failure, PrivacyPolicyModel>> getPrivacyPolicy() async{
    try {
      final res = await basePagesRemoteDatasource.getPrivacyPolicy();
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
  Future<Either<Failure, CurrenciesModel>> getCurrencies() async{
    try {
      final res = await basePagesRemoteDatasource.getCurrencies();
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
