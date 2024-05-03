import 'package:dartz/dartz.dart';
import 'package:wein_buyer/view/user/pages/domain/repository/base_pages_repository.dart';
import '../../../../../../../core/error/failure.dart';
import '../../../../../../../core/models/fqs_model.dart';

class GetFaqs {
  final BasePagesRepository basePagesRepository;

  GetFaqs(this.basePagesRepository);

  Future<Either<Failure, FqsModel>> execute() async {
    return await basePagesRepository.getFaqs();
  }
}
