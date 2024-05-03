import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/fqs_model.dart';
import '../../../../../../../core/models/privacy_policy_model.dart';
import '../../../../../../../core/models/terms_model.dart';
import '../../../../../core/models/currencies_model.dart';

abstract class BasePagesRepository {
  Future<Either<Failure, FqsModel>> getFaqs();
  Future<Either<Failure, TermsModel>> getTerms();
  Future<Either<Failure, PrivacyPolicyModel>> getPrivacyPolicy();
  Future<Either<Failure, CurrenciesModel>> getCurrencies();

}
