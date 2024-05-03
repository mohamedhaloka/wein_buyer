import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failure.dart';
import '../repository/base_account_repository.dart';

class ContactUs {
  final BaseAccountRepository baseAccountRepository;

  ContactUs(this.baseAccountRepository);

  Future<Either<Failure, bool>> execute(
      String name, String email, String phone, String msg) async {
    return await baseAccountRepository.contactUs(name, email, phone, msg);
  }
}
