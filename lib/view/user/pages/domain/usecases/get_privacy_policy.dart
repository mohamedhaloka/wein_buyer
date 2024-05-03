import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/pages/domain/repository/base_pages_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/terms_model.dart';

class GetTerms {
  final BasePagesRepository basePagesRepository;

  GetTerms(this.basePagesRepository);

  Future<Either<Failure, TermsModel>> execute() async {
    return await basePagesRepository.getTerms();
  }
}
