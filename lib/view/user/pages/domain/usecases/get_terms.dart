import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/privacy_policy_model.dart';
import 'package:wein_buyer/view/user/pages/domain/repository/base_pages_repository.dart';
import '../../../../../../../core/error/failure.dart';

class GetPrivacyPolicy {
  final BasePagesRepository basePagesRepository;

  GetPrivacyPolicy(this.basePagesRepository);

  Future<Either<Failure, PrivacyPolicyModel>> execute() async {
    return await basePagesRepository.getPrivacyPolicy();
  }
}
