import 'package:dartz/dartz.dart';
import '../../../../../../../core/error/failure.dart';
import '../repository/base_account_repository.dart';


class DeleteAccountProvider {
  final BaseAccountRepository baseAccountRepository;

  DeleteAccountProvider(this.baseAccountRepository);

  Future<Either<Failure, bool>> execute() async {
    return await baseAccountRepository.deleteAccount();
  }
}
