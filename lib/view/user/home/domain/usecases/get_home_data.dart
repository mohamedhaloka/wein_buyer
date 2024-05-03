import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/home_model.dart';
import 'package:wein_buyer/view/user/home/domain/repository/base_home_repository.dart';

import '../../../../../../../core/error/failure.dart';

class GetHomeData {
  final BaseHomeRepository baseHomeRepository;

  GetHomeData(this.baseHomeRepository);

  Future<Either<Failure, HomeModel>> execute() async {
    return await baseHomeRepository.getHomeData();
  }
}
