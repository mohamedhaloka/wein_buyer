import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../repository/base_utils_repository.dart';

class GetVerifiedStatus {
  final BaseUtilsRepository baseUtilsRepository;

  GetVerifiedStatus(this.baseUtilsRepository);

  Future<Either<Failure, bool>> execute() async {
    return await baseUtilsRepository.getVerifiedStatus();
  }
}
