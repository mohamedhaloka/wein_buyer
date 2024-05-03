import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/sizes_model.dart';
import '../../../../../../core/error/failure.dart';
import '../repository/base_utils_repository.dart';

class GetSizes {
  final BaseUtilsRepository baseUtilsRepository;

  GetSizes(this.baseUtilsRepository);

  Future<Either<Failure, SizesModel>> execute() async {
    return await baseUtilsRepository.getSizes();
  }
}
