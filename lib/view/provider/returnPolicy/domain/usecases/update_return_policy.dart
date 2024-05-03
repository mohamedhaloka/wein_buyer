import 'package:dartz/dartz.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/products_model.dart';
import 'package:wein_buyer/view/provider/market/domain/repository/base_market_repository.dart';
import '../../../../../../core/error/failure.dart';
import '../repository/base_return_policy_repository.dart';

class UpdateReturnPolicy {
  final BaseReturnPolicyRepository baseReturnPolicyRepository;

  UpdateReturnPolicy(this.baseReturnPolicyRepository);

  Future<Either<Failure, bool>> execute(String content) async {
    return await baseReturnPolicyRepository.updateReturnPolicy(content);
  }
}
