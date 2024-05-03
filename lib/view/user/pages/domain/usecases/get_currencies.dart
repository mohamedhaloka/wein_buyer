import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/privacy_policy_model.dart';
import 'package:wein_buyer/view/user/pages/domain/repository/base_pages_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../core/models/currencies_model.dart';

class GetCurrencies {
  final BasePagesRepository basePagesRepository;

  GetCurrencies(this.basePagesRepository);

  Future<Either<Failure, CurrenciesModel>> execute() async {
    return await basePagesRepository.getCurrencies();
  }
}
